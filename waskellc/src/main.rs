use std::{
    fs,
    process::{Command, Output},
};

use clap::Parser;

use waskellc::compile;

#[derive(Parser)]
#[command(version, about, long_about = None)]
struct Args {
    input: String,

    #[clap(short, long, default_value = None)]
    output: Option<String>,
}

fn out_path(in_path: &str) -> String {
    let mut split = in_path.split(".").collect::<Vec<&str>>();
    let split_len = split.len();
    split[split_len - 1] = "wasm";
    split.join(".")
}

fn merge_command(out_path: &str) -> Result<(), String> {
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
        .arg(out_path)
        .arg("out")
        .arg("-o")
        .arg(out_path.to_owned())
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
    let out_path = args.output.unwrap_or_else(|| out_path(&args.input));

    let module_bytes = compile(&file_contents)?;

    fs::write(&out_path, module_bytes).unwrap();

    merge_command(&out_path)
}
