//! An example of how to interact with wasm memory.
//!
//! Here a small wasm module is used to show how memory is initialized, how to
//! read and write memory through the `Memory` object, and how wasm functions
//! can trap when dealing with out-of-bounds addresses.

// You can execute this example with `cargo run --example memory`

use wasmtime::*;

mod code_gen;
mod hello;
mod linking;
mod memory;
mod ref_types;
mod tail_call;
mod usage_example;
mod wasi;
mod waskell_types;

fn main() -> Result<()> {
    let args: Vec<String> = std::env::args().collect();

    if args.len() != 2 {
        eprintln!("Usage: {} <program to run>", args[0]);
        std::process::exit(1);
    }

    let program = &args[1];
    match program.as_str() {
        "memory" => memory::memory_main(),
        "hello" => hello::hello_main(),
        "wasi" => wasi::wasi_main(),
        "linking" => linking::linking_main(),
        "ref_types" => ref_types::ref_types_main(),
        "tail_call" => tail_call::tail_call_main(),
        "code_gen" => code_gen::code_gen_main(),
        "usage_example" => usage_example::usage_example_main(),
        "waskell_types" => waskell_types::waskell_types_main(),
        _ => {
            eprintln!("Unknown program: {}", program);
            std::process::exit(1);
        }
    }
}
