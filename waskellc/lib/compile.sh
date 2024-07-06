rustup target add wasm32-wasi

rustc --target wasm32-wasi -o rust_lib.wasm rust_lib.rs
../binaryen-tools/x86_64/linux/bin/wasm-merge -all rust_lib.wasm rust_lib lib.wat lib -o lib.wasm
