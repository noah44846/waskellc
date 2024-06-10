# Build

Given the WIT and WAT files build as follows:

```shell
wasm-tools component embed ./wit/deps/adder.wit adder.wat -o adder.wasm
wasm-tools component new adder.wasm -o out/adder.wasm
wasm-tools component embed ./wit calculator.wat -w calculator -o calculator.wasm
wasm-tools component new calculator.wasm -o out/calculator.wasm
wac plug out/calculator.wasm --plug out/adder.wasm -o out/composed.wasm
```
