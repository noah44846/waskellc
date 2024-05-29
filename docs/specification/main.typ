// ---------------------------------------------------------------------------
// Copyright © 2024 Haute école d'ingénierie et d'architecture de Fribourg
// SPDX-License-Identifier: Apache-2.0
// ---------------------------------------------------------------------------
// Author : Noah Godel <noah.godel@edu.hefr.ch>
// Date   : 10 March 2024
// ---------------------------------------------------------------------------
// Example of a student reports at the Haute école d'ingénierie et
// d'architecture de Fribourg
// ---------------------------------------------------------------------------

#import "lib/heiafr.typ": report, code_block
#import "@preview/big-todo:0.2.0": *
#import "@preview/tablex:0.0.8": tablex, hlinex, vlinex
#import "@preview/cetz:0.2.2": canvas, plot

#set text(region: "ch", lang: "en")

// N.B. : The versions array needs to be ordered from the oldest to the newest
#let versions = (
  (
    version: "0.1",
    date: datetime(year: 2024, month: 05, day: 27),
    changes: [First version],
  ),
)

#show: doc => report(
  lang: "en",
  type: [Bachelor thesis],
  year: [2024],
  departement: [Department of Computer Science],
  profile: [Software Engineering Orientation],
  title: [
    Functional language compiler to WebAssembly
  ],
  subtitle: [
    Technical documentation
  ],
  authors: (
    (firstname: "Noah", lastname: "Godel", gender: "h"),
  ),
  supervisors: ("Jacques Supcik", "Serge Ayer"),
  supervisors_label: "Supervisors",
  experts: ("Baptiste Wicht", "Valentin Bourqui"),
  experts_label: "Experts",
  versions: versions,
  theme_color: rgb(0,124,183,255),
  doc,
)

= Context

The functional programming paradigm offers significant advantages for certain types of problems, such as data transformations, parallel processing, and mathematical computations. However, it has limitations, and there are many use cases where imperative or object-oriented programming paradigms are more suitable. Ideally, developers should be able to leverage the strengths of different programming paradigms within the same codebase, using the most appropriate approach for each part of the project. Unfortunately, integrating functional languages into existing codebases written in other programming languages can be challenging.

WebAssembly (Wasm) is a portable and high-performance bytecode format designed to execute code at near-native speeds. It allows code written in various programming languages like C, C++, Rust, and others to be compiled to Wasm bytecode, which can then run in environments such as web browsers and Wasm runtimes like Wasmer.

By developing a new functional programming language that compiles to Wasm, we can combine the benefits of functional programming with the performance and portability of Wasm. This approach would enable seamless integration and embedding of high-performance functional code into existing codebases written in different languages. Developers could utilize the strengths of functional programming for specific parts of their projects, while leveraging other paradigms for the remaining codebase.

To generate efficient machine code for the new functional programming language, we will leverage the LLVM framework. LLVM is a modular and extensible compiler framework that supports a wide range of programming languages and processor architectures. Notably, LLVM supports Wasm as a compilation target, allowing it to generate optimized Wasm bytecode from an intermediate representation called LLVM IR. One of LLVM's key advantages is its ability to generate highly optimized machine code for various platforms, including Wasm, ensuring optimal performance for the compiled functional language.

= Objectives

Upon the completion of the project, the following objectives will be achieved:

- *Functional Programming Language Specification*: A comprehensive specification defining the syntax, semantics, and features of a new functional programming language, incorporating key concepts such as pattern matching, first-class functions, immutable data structures, a simple type system, a module system for organizing and encapsulating code, and a minimal standard library.

- *Functioning Compiler*: A fully operational compiler capable of translating the defined functional programming language into efficient Wasm bytecode, enabling high-performance execution across various environments and platforms. While not the primary focus, the compiler should also support generating native executables, although the primary target will be Wasm.

- *Language Documentation*: Extensive documentation detailing the usage and development of the new functional programming language, including examples, and reference materials to facilitate learning and adoption by developers.

- *Integration Examples*: A collection of examples demonstrating the integration and execution of the compiled Wasm code within different programming languages and frameworks, showcasing the language's interoperability and potential for seamless embedding.

- *Embedding Demonstrations*: Practical demonstrations illustrating the embedding and utilization of the new functional language within existing codebases written in other programming languages, highlighting its ability to coexist with and complement other programming paradigms.

By achieving these objectives, the project will deliver a well-defined functional programming language optimized for Wasm execution, along with a functioning compiler, documentation, integration examples, and embedding demonstrations. While not production-ready after the 7-week timeline, the project will serve as a proof of concept and a foundation for potential further development, with the potential for future adoption and integration into codebases.

= Tasks

#set enum(numbering: "1.1.", full: true)

+ *Define Language Specification*
  + Conduct research on existing functional programming languages and their features.
  + Specify the syntax, semantics, and core language features, including pattern matching, first-class functions, immutable data structures, type system, and module system.
  + Design the requirements and structure for a minimal standard library.
+ *Develop Compiler*
  + Research the requirements and best practices for compiling to Wasm using LLVM and what language to use for the front-end.
  + Implement a minimal viable compiler (lexer, parser and LLVM-IR code generation) for the new functional language with limited features.
  + Configure and integrate LLVM to generate Wasm bytecode (and native code) from the LLVM-IR output.
  + Optimize the compiler to generate efficient Wasm code and explore LLVM optimizations for the generated code.
  + Implement the remaining language features and optimizations to complete the compiler.
  + Implement a simple standard library for the language.
+ *Testing and Validation*
  + Develop an automated test suite to validate the correctness of the compiler and the Wasm bytecode.
  + Perform testing of code embedding and execution in different environments and platforms.
  + Conduct performance benchmarking and analysis to evaluate the efficiency of the compiled code.
+ *Create Language Documentation*
  + Draft comprehensive documentation covering the language syntax, semantics, features, and a reference for the standard library.
  + Develop examples to facilitate learning and adoption of the language and its embedded use cases.
+ *Project Documentation*
  + Write a requirements specification document outlining the context, objectives, tasks, and planning for the project.
  + Prepare a detailed project report documenting the design, implementation, and evaluation of the language and compiler.

#set page(flipped: true)

= Planning

@img_gantt shows the Gantt chart representing the project timeline and tasks.

#align(horizon + center)[
  #figure(
    image("img/gantt.png", width: 100%),
    caption: [Gantt chart showing the project timeline and tasks.],
  ) <img_gantt>
]

#set page(flipped: false)
