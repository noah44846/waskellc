# Run Wasm component

Take the Wasm component from `../../build_component/direct/hello-world/out/hello-world.wasm` or `../../build_component/direct/calculator/out/composed.wasm`

```sh
npm i
npx jco transpile hello-world.wasm -o hello-world
# or
npx jco transpile calculator.wasm -o calculator 
```
