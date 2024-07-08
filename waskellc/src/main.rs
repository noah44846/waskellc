// SPDX-License-Identifier: MIT

//! Main entry point for the Waskell compiler

use std::{fs, path::PathBuf, process::Command};

use anyhow::anyhow;
use clap::Parser;

use waskellc::{compile, DebugOptions};

/// Default path to wasm lib file
const DEFAULT_WASM_LIB_PATH: &str = "lib/lib.wasm";
/// Default path to prelude file
const DEFAULT_PRELUDE_PATH: &str = "lib/prelude.wsk";

/// CLI arguments struct
#[derive(Parser)]
#[command(version, about, long_about = None)]
struct Args {
    /// Path to input file
    input: PathBuf,

    /// Path to output file
    #[arg(short, long, default_value = None)]
    output: Option<PathBuf>,

    /// Path to wasm lib file (default: lib/lib.wasm)
    #[arg(
        short = 'l',
        long,
        default_value = DEFAULT_WASM_LIB_PATH,
        help = "Path to wasm lib file"
    )]
    wasm_lib_path: PathBuf,

    /// Path to prelude file (default: lib/prelude.wsk)
    #[arg(
        short = 'p',
        long,
        default_value = DEFAULT_PRELUDE_PATH,
        help = "Path to prelude file"
    )]
    prelude_path: PathBuf,

    /// Debug mode
    #[arg(short = 'd', long)]
    debug: bool,

    /// Debug option: Print lexer output
    #[arg(requires("debug"), short = 'L', long, help = "Print lexer output")]
    debug_lexer: bool,

    /// Debug option: Print AST
    #[arg(requires("debug"), short = 'A', long, help = "Print AST")]
    debug_ast: bool,

    /// Debug option: Print symbol table
    #[arg(requires("debug"), short = 'S', long, help = "Print symbol table")]
    debug_symbols: bool,

    /// Debug option: Print desugared symbol table
    #[arg(
        requires("debug"),
        short = 'D',
        long,
        help = "Print desugared symbol table"
    )]
    debug_desugar: bool,

    /// Debug option: Print WAT output of wasm module
    #[arg(
        requires("debug"),
        short = 'W',
        long,
        help = "Print WAT output of wasm module"
    )]
    debug_wasm: bool,

    /// Debug option: Show offsets in WAT output
    #[arg(
        requires("debug_wasm"),
        short = 's',
        long,
        default_value = "false",
        help = "Show offsets in WAT output"
    )]
    show_wasm_offsets: bool,

    /// Do not merge wasm module with wasm lib
    #[arg(long, default_value = "false")]
    no_merge: bool,
}

/// Get output path from input path by changing extension to wasm
fn out_path(in_path: PathBuf) -> PathBuf {
    let mut out_path = in_path;
    out_path.set_extension("wasm");
    out_path
}

/// Run wasm-merge command to merge wasm module with wasm lib.
/// Takes output path and wasm lib path as arguments.
/// Works on Windows x86_64, Linux x86_64, MacOS x86_64 and MacOS arm64.
fn merge_command(out_path: PathBuf, wasm_lib_path: PathBuf) -> Result<(), anyhow::Error> {
    let mut cmd;

    if cfg!(target_os = "windows") && cfg!(target_arch = "x86_64") {
        cmd = Command::new("./binaryen-tools/x86_64/windows/bin/wasm-merge.exe");
    } else if cfg!(target_os = "linux") && cfg!(target_arch = "x86_64") {
        cmd = Command::new("./binaryen-tools/x86_64/linux/bin/wasm-merge");
    } else if cfg!(target_os = "macos") && cfg!(target_arch = "x86_64") {
        cmd = Command::new("./binaryen-tools/x86_64/macos/bin/wasm-merge");
    } else if cfg!(target_os = "macos") && cfg!(target_arch = "arm64") {
        cmd = Command::new("./binaryen-tools/arm64/macos/bin/wasm-merge");
    } else {
        return Err(anyhow!("Unsupported platform"));
    }

    let out = cmd
        .arg(&wasm_lib_path)
        .arg("lib")
        .arg(&out_path)
        .arg("out")
        .arg("-o")
        .arg(&out_path)
        .output()?;

    if out.status.success() {
        Ok(())
    } else {
        Err(anyhow!(
            "Failed to merge wasm files : {}",
            String::from_utf8_lossy(&out.stderr)
        ))
    }
}

/// Main entry point
fn main() {
    let args = Args::parse();

    let file_contents = fs::read_to_string(&args.input).unwrap();
    let prelude_contents = fs::read_to_string(&args.prelude_path).unwrap();
    let out_path = args.output.unwrap_or_else(|| out_path(args.input));

    let module_bytes = compile(
        &file_contents,
        &prelude_contents,
        DebugOptions {
            debug_lexer: args.debug_lexer,
            debug_ast: args.debug_ast,
            debug_symbols: args.debug_symbols,
            debug_desugar: args.debug_desugar,
            debug_wasm: args.debug_wasm,
            show_wasm_offsets: args.show_wasm_offsets,
        },
    );

    let module_bytes = if let Ok(module_bytes) = module_bytes {
        module_bytes
    } else {
        eprintln!("{}", module_bytes.unwrap_err());
        std::process::exit(1);
    };

    fs::write(&out_path, module_bytes).unwrap();

    if !args.no_merge {
        merge_command(out_path.clone(), args.wasm_lib_path).unwrap_or_else(|e| {
            eprintln!("{}", e);
            std::process::exit(1);
        });
    }
}

#[cfg(test)]
mod tests {
    use std::{fs, io::Write};

    use anyhow::anyhow;
    use tempfile::NamedTempFile;
    use wasi_common::sync::WasiCtxBuilder;
    use wasmtime::*;

    use super::*;

    const DEFAULT_PRELUDE_PATH: &str = "lib/prelude.wsk";
    const DEFAULT_PRELUDE_TEST: &str = include_str!("../examples/prelude_test.wsk");

    /// Compile and run prelude test
    #[test]
    fn test_prelude() -> Result<()> {
        let prelude_contents = fs::read_to_string(DEFAULT_PRELUDE_PATH).unwrap();

        let result = compile(
            DEFAULT_PRELUDE_TEST,
            &prelude_contents,
            DebugOptions::default(),
        )
        .map_err(|e| anyhow!(e))?;

        let mut temp_file = NamedTempFile::new()?;
        temp_file.write_all(&result)?;

        merge_command(
            PathBuf::from(temp_file.path()),
            PathBuf::from(DEFAULT_WASM_LIB_PATH),
        )
        .map_err(|e| anyhow!(e))?;

        let engine = Engine::default();
        let mut linker = Linker::new(&engine);
        wasi_common::sync::add_to_linker(&mut linker, |s| s)?;

        let wasi = WasiCtxBuilder::new().inherit_stdio().build();
        let mut store = Store::new(&engine, wasi);

        let module = Module::from_file(store.engine(), temp_file.path())?;
        let instance = linker.instantiate(&mut store, &module)?;

        let main = instance.get_typed_func::<(), ()>(&mut store, "main")?;
        main.call(&mut store, ())?;

        Ok(())
    }
}
