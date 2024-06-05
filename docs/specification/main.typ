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
  (
    version: "0.2",
    date: datetime(year: 2024, month: 05, day: 30),
    changes: [Reduce the scope of the project to a subset of an existing functional language and direct mentions to LLVM.],
  ),
  (
    version: "1.0",
    date: datetime(year: 2024, month: 06, day: 05),
    changes: [Minor corrections and final version.],
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
    Requirements specification
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

By developing a compiler for a functional programming language, or in this case, a subset of an already existing one, that compiles to Wasm, we can combine the benefits of functional programming with the performance and portability of Wasm. This approach would enable seamless integration and embedding of high-performance functional code into existing codebases written in different languages. Developers could utilize the strengths of functional programming for specific parts of their projects, while leveraging other paradigms for the remaining codebase.

Embedding is the process of integrating code written in one programming language into a codebase written in another language. In this project, we aim to demonstrate the embedding of the new functional programming language compiled to Wasm into existing codebases written in other languages. This will showcase the interoperability and potential for combining different programming paradigms within the same project. @img_embedding illustrates the concept of embedding a Wasm module into a codebase.

#figure(
  image("img/embedding.png", width: 60%),
  caption: [Illustration of embedding a Wasm module into a codebase.],
) <img_embedding>

= Objectives

Upon the completion of the project, the following objectives will be achieved:

- *Functional Programming Language Specification*: A specification of a functional programming language that is a subset of an existing functional language, tailored for efficient compilation to Wasm bytecode and seamless embedding into existing codebases. A subset of the standard library will be defined to support the language features.

- *Functioning Compiler*: A fully operational compiler capable of translating the defined functional programming language into efficient Wasm bytecode, enabling high-performance execution across various environments and platforms. The compiled code should be able to seamlessly interact with other programming languages its embedded into.

- *Language Documentation*: A documentation detailing the usage and development of the new functional programming language, including examples, and reference materials to facilitate learning and adoption by developers. Examples of embedding the language into existing codebases of different languages will be provided.

By achieving these objectives, the project will deliver a well-defined functional programming language optimized for Wasm execution, along with a functioning compiler, documentation, and embedding demonstrations. While not production-ready after the 7-week timeline, the project will serve as a proof of concept and a foundation for potential further development.

= Tasks

#set enum(numbering: "1.1.", full: true)

+ *Define Language Specification*
  + Conduct research on existing functional programming languages and choose a suitable language to base the new language on.
    - _Deliverable_: A chapter in the project report detailing the chosen language, the subset of features to include, and the modifications required for efficient compilation to Wasm.
    - _Estimated workload_: 2 days
  + Design the requirements and structure for a minimal standard library.
    - _Deliverable_: A chapter in the project report outlining the standard library features that will be implemented.
    - _Estimated workload_: 1 day
+ *Develop Compiler*
  + Research different code generation strategies and tools for compiling to Wasm and choose the most suitable approach.
    - _Deliverable_: A chapter in the project report detailing the choice of code generation strategy and tools and a small proof of concept.
    - _Estimated workload_: 2 days
  + Implement a minimal viable compiler (lexer, parser and code generation) for the new functional language with limited features.
    - _Deliverable_: A working compiler that can generate simple Wasm bytecode from the input language and a chapter in the project report detailing the implementation.
    - _Estimated workload_: 5 days
  + Implement the remaining language features and optimizations to complete the compiler.
    - _Deliverable_: A fully functional compiler capable of translating the entire language subset to Wasm bytecode.
    - _Estimated workload_: 6 days
  + Implement a simple standard library for the language.
    - _Deliverable_: A working standard library that supports the language features and a chapter in the project report.
    - _Estimated workload_: 3 days

#pagebreak()

3. *Testing and Validation*
  + Develop an automated test suite to validate the correctness of the compiler and the Wasm bytecode.
    - _Deliverable_: Working test suite and a chapter in the project report detailing the testing strategy.
    - _Estimated workload_: 3 days
  + Perform testing of code embedding and execution in different environments and platforms.
    - _Deliverable_: A chapter in the project report detailing the testing results and validation.
    - _Estimated workload_: 2 days
  + Conduct performance benchmarking and analysis to evaluate the efficiency of the compiled code.
    - _Deliverable_: A chapter in the project report detailing the benchmarking methodology, results, and analysis.
    - _Estimated workload_: 1 day
+ *Create Language Documentation*
  + Develop examples to facilitate learning and adoption of the language and its embedded use cases.
    - _Deliverable_: A set of examples demonstrating the language features and embedding capabilities.
    - _Estimated workload_: 3 days
  + Draft a documentation covering the language syntax, semantics, features, and a reference for the standard library.
    - _Deliverable_: A small documentation of the language and standard library.
    - _Estimated workload_: 2 days
+ *Project Documentation*
  + Write a requirements specification document outlining the context, objectives, tasks, and planning for the project.
    - _Deliverable_: A detailed requirements specification document.
    - _Estimated workload_: 4 days
  + Prepare a detailed project report documenting the design, implementation, and evaluation of the language and compiler.
    - _Deliverable_: A comprehensive project report.
    - _Estimated workload_: 8 days (ongoing throughout the project, included in the tasks themselves)

= Planning

@tbl_timeline illustrates the project timeline and tasks for the 7-week duration.

#figure(
  table(
    columns: 3, 
    inset: 6pt,
    stroke: none,
    align: left,
    table.header([*Week*], [*Description*], [*Deliverables*]),
    table.hline(stroke: 1pt),
    table.vline(stroke: 1pt, x: 1),
    table.vline(stroke: 1pt, x: 2),
    [Week 1], [Write the requirements specification document and start the project report.], [The requirements specification document.],
    table.hline(stroke: 0.5pt),
    [Week 2], [Define the language specification, design the standard library and research code generation strategies.], [The chapters in the project report detailing the language specification, standard library design, and code generation strategy.],
    table.hline(stroke: 0.5pt),
    [Week 3], [Implement the lexer, parser, and code generation for a minimal viable compiler.], [A working compiler that can generate simple Wasm bytecode and a chapter in the project report detailing the implementation.],
    table.hline(stroke: 0.5pt),
    [Week 4], [Implement some remaining language features.], [A functional compiler capable of translating a big part of the language to Wasm bytecode.],
    table.hline(stroke: 0.5pt),
    [Week 5], [Finish the compiler implementation and implement a simple standard library.], [A fully functional compiler capable of translating the entire language subset to Wasm bytecode and a chapter in the project report detailing the standard library implementation.],
    table.hline(stroke: 0.5pt),
    [Week 6], [Develop an automated test suite, test code embedding and execution, and conduct performance benchmarking.], [A chapter in the project report detailing the testing strategy, results, and benchmarking methodology, results, and analysis.],
    table.hline(stroke: 0.5pt),
    [Week 7], [Draft comprehensive language documentation and examples.], [A chapter in the project report detailing the documentation structure and content, and examples for learning and adoption.],
  ),
  caption: [Project timeline and tasks.],
) <tbl_timeline>

#pagebreak()

The project will be divided into 7 weeks, with each week focusing on specific tasks and deliverables. The timeline is designed to ensure a structured and organized approach to the project, allowing for the completion of the defined objectives within the allocated time frame.

The project will follow an iterative development process, with continuous testing and validation (where appropriate) to ensure the quality and correctness of the compiler and language implementation.

#heading(level: 2, numbering: none, outlined: false)[Project management tools]

The project will utilize git for version control, allowing for tracking changes to the codebase. Gitlab issues will be used to manage tasks, and track progress. An issue will be created for each task, detailing the task description, estimated workload, and deadline.

#set page(flipped: true)

#align(horizon)[
  @img_gantt shows the Gantt chart representing the project timeline and tasks.
  
  #align(center)[
    #figure(
      image("img/gantt.png"),
      caption: [Gantt chart showing the project timeline and tasks.],
    ) <img_gantt>
  ]
]

#set page(flipped: false)
