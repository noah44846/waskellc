//! An example of how to interact with wasm memory.
//!
//! Here a small wasm module is used to show how memory is initialized, how to
//! read and write memory through the `Memory` object, and how wasm functions
//! can trap when dealing with out-of-bounds addresses.

// You can execute this example with `cargo run --example memory`

use wasmtime::*;

//mod memory;
//mod hello;
//mod wasi;
mod linking;

fn main() -> Result<()> {
    //memory::memory_main()
    //hello::hello_main()
    //wasi::wasi_main()
    linking::linking_main()
}