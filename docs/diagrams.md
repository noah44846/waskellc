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

    section Milestones
        Project start              : milestone, 27.05.2024, 0h
        Requirements specification : milestone, after d8,   0h
        First working prototype    : milestone, after d3,   0h
        Complete Compiler          : milestone, after d7,   0h
        Documentation submission   : milestone, after d9,   0h

    section Language Specification
        Pick a fp languages               : d1, 31.05.2024, 2d
        Design a minimal standard library :                 1d
    section Develop Compiler
        Research code generation stategies              :                            2d
        Implement a minimal viable compiler             :            d2, 07.06.2024, 5d
        Implement the remaining features                :            d4, after d3,   6d
        Implement the standard library for the language :            d6, after d5,   3d
    section Testing
        Implement testing ...                           : d3, after d2, 1d
        Implement testing ...                           : d5, after d4, 1d
        Implement testing ...                           : d7, after d6, 1d
        Perform testing of code embedding and execution : 2d
        Conduct performance benchmarking and analysis   : 1d
    section Language Documentation
        Develop examples to facilitate learning : 3d
        Draft language documentation            : 2d
    section Project Documentation
        Write the requirements specification :            d8, 27.05.2024,  4d
        Write a detailed project report      :            d9, after d8,   30d
```
