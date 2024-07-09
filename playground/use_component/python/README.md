# Generate bindings

Take the Wasm component from `../../build_component/direct/hello-world/out/hello-world.wasm`

```sh
python -m wasmtime.bindgen hello-world.wasm --out-dir hello-world
```
