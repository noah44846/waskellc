# Compile Wasm library

If the wasm32-unknown-unknown target is not installed, install it with:

```bash
$ rustup target add wasm32-unknown-unknown
```

To compile the library, run:

```bash
$ rustc --target wasm32-unknown-unknown -o lib.wasm lib.rs
```
