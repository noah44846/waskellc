use std::{env, fs};

use waskellc::compile;

fn main() -> Result<(), String> {
    let args: Vec<String> = env::args().collect();
    if args.len() != 2 {
        println!("Usage: waskellc <filename>");
        return Ok(());
    }

    let file_contents = fs::read_to_string(&args[1]).unwrap();

    let module = compile(&file_contents)?;

    fs::write("out.wasm", module.finish()).unwrap();

    Ok(())
}
