# Compile Wasm library

If the wasm32-unknown-unknown target is not installed, install it with:

```bash
$ rustup target add wasm32-unknown-unknown
```

To compile the library, run:

```bash
$ rustc --target wasm32-unknown-unknown -o alloc.wasm alloc.rs
$ ../binaryen-tools/x86_64/linux/bin/wasm-merge -all alloc.wasm alloc lib.wat lib -o lib.wasm
```
