# Waskellc

A compiler for the Waskell programming language (subset of Haskell) that targets WebAssembly.

## Getting started

1. Compile the wasm library in wasm-lib/ (See [wasm-lib/README.md](its README)).
2. Download the [binaryen](https://github.com/WebAssembly/binaryen/) tools using the `./download_binaryen_tools.sh` script.
3. Build or run the compiler using `cargo build` or `cargo run -- -h`.
