// SPDX-License-Identifier: MIT

use std::{fs, path::PathBuf, process::Command};

use clap::Parser;

use waskellc::compile;

#[derive(Parser)]
#[command(version, about, long_about = None)]
struct Args {
    input: PathBuf,

    #[arg(short, long, default_value = None)]
    output: Option<PathBuf>,

    #[arg(short = 'd', long)]
    debug: bool,

    #[arg(requires("debug"), short = 'L', long, help = "Print lexer output")]
    debug_lexer: bool,

    #[arg(requires("debug"), short = 'A', long, help = "Print AST")]
    debug_ast: bool,

    #[arg(requires("debug"), short = 'S', long, help = "Print symbol table")]
    debug_symbols: bool,

    #[arg(
        requires("debug"),
        short = 'D',
        long,
        help = "Print desugared symbol table"
    )]
    debug_desugar: bool,

    #[arg(
        requires("debug"),
        short = 'W',
        long,
        help = "Print WAT output of wasm module"
    )]
    debug_wasm: bool,

    #[arg(
        requires("debug_wasm"),
        short = 's',
        long,
        default_value = "false",
        help = "Show offsets in WAT output"
    )]
    show_wasm_offsets: bool,

    #[arg(long, default_value = "false")]
    no_merge: bool,
}

fn out_path(in_path: PathBuf) -> PathBuf {
    let mut out_path = in_path;
    out_path.set_extension("wasm");
    out_path
}

fn merge_command(out_path: PathBuf) -> Result<(), String> {
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
        return Err("Unsupported platform".to_string());
    }

    let out = cmd
        .arg("wasm-lib/lib.wasm")
        .arg("lib")
        .arg(&out_path)
        .arg("out")
        .arg("-o")
        .arg(&out_path)
        .output()
        .expect("Failed to merge wasm files");

    if out.status.success() {
        Ok(())
    } else {
        Err(format!(
            "Failed to merge wasm files : {}",
            String::from_utf8_lossy(&out.stderr)
        ))
    }
}

fn main() -> Result<(), String> {
    let args = Args::parse();

    let file_contents = fs::read_to_string(&args.input).unwrap();
    let out_path = args.output.unwrap_or_else(|| out_path(args.input));

    let module_bytes = compile(
        &file_contents,
        args.debug_lexer,
        args.debug_ast,
        args.debug_symbols,
        args.debug_desugar,
        args.debug_wasm,
        args.show_wasm_offsets,
    )?;

    fs::write(&out_path, module_bytes).unwrap();

    if !args.no_merge {
        merge_command(out_path)
    } else {
        Ok(())
    }
}
