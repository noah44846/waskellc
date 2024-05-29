# Conversion

```sh
mmdc -i diagrams.md -o out/diagram.png -s 3
```

# Diagrams

## Planning

```mermaid
---
config:
  theme: default
  gantt:
    useWidth: 1600
---
gantt
    title Functional language compiler to WebAssembly
    dateFormat DD.MM.YYYY
    axisFormat %d.%m
    tickInterval 1day
    weekday monday
    todayMarker off
    excludes weekends

    section Language Specification
        Research on existing fp languages                         : d1, 30.05.2024, 1d
        Specify the syntax, semantics, and core language features :                 1d
        Design a minimal standard library                         :                 1d
    section Develop Compiler
        Research compiling to Wasm using LLVM              :            1d
        Implement a minimal viable compiler                :            5d
        Configure and integrate LLVM to generate Wasm      :            2d
        First working prototype                            : milestone, 0h
        Optimize the compiler to generate efficient Wasm   :            1d
        Implement the remaining features and optimizations :            6d
        Implement the standard library for the language    :            3d
        Complete Compiler                                  : milestone, 0h
    section Testing
        Develop an automated test suite                 : 2d
        Perform testing of code embedding and execution : 2d
        Conduct performance benchmarking and analysis   : 1d
    section Language Documentation
        Draft comprehensive documentation       : 1d
        Develop examples to facilitate learning : 2d
    section Project Documentation
        Write requirements specification  :            d2, 27.05.2024,  3d
        Prepare a detailed project report :                            31d
        Documentation submission          : milestone,                  0h
```
