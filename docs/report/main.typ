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

#import "lib/heiafr.typ": report, code_block, glss, glsl
#import "@preview/glossarium:0.4.1": gls, glspl
#import "@preview/big-todo:0.2.0": *
#import "@preview/cetz:0.2.2": canvas, plot

#set text(region: "ch", lang: "en")

// N.B. : The versions array needs to be ordered from the oldest to the newest
#let versions = (
  (
    version: "0.1",
    date: datetime(year: 2024, month: 05, day: 31),
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

//#figure(
  //image("img/embedding.png", width: 60%),
  //caption: [Illustration of embedding a Wasm module into a codebase.],
//) <img_embedding>

//#figure(
  //table(
    //columns: 3,
    //inset: 6pt,
    //stroke: none,
    //align: left,
    //table.header([*Week*], [*Description*], [*Deliverables*]),
    //table.hline(stroke: 1pt),
    //table.vline(stroke: 1pt, x: 1),
    //table.vline(stroke: 1pt, x: 2),
    //[Week 1], [Write the requirements specification document and start the project report.], [The requirements specification document.],
    //table.hline(stroke: 0.5pt),
    //[Week 2], [Define the language specification, design the standard library and research code generation strategies.], [The chapters in the project report detailing the language specification, standard library design, and code generation strategy.],
  //),
  //caption: [Project timeline and tasks.],
//) <tbl_timeline>

#todo_outline

= Introduction

This report documents the development of a functional language compiler to #gls("wasm"). The project was conducted as part of the Bachelor's thesis at the #gls("heiafr"). The goal of the project was to design and implement a compiler for a functional language that targets #glss("wasm"). The project was supervised by Dr. Jacques Supcik and Dr. Serge Ayer, with Dr. Baptiste Wicht and Valentin Bourqui as experts. For further details,
please refer to the requirement specification document @spec_doc. The project repository can be found at the following URL.

#align(center)[https://gitlab.forge.hefr.ch/noah.godel/24-tb-wasm-compiler]

== Context

The functional programming paradigm offers advantages for certain types of problems like data transformations, parallel processing, and mathematical computations. However, it has limitations, and many use cases are better suited for imperative or object-oriented programming. Ideally, developers should be able to leverage the strengths of different paradigms within the same codebase. Unfortunately, integrating functional languages into existing codebases written in other languages can be challenging.

#gls("wasm") is a bytecode format designed to execute code at near-native speeds across different environments like web browsers and #glspl("wasm_runtime"). By developing a compiler for a functional language, or in the context of this project, a subset of an existing one, that compiles to #glss("wasm"), we can combine functional programming benefits with #glss("wasm")'s performance and portability. This enables seamless integration of high-performance functional code into codebases of different languages, allowing developers to utilize functional programming strengths for specific components.

The project aims to demonstrate embedding the new functional language compiled to #glss("wasm") into existing codebases, showcasing interoperability and the potential for combining paradigms within the same project. For more details on the context, refer to the requirements specification document @spec_doc.

== Objectives

Upon completion of the project, the following key objectives will be achieved:

- *Functional Programming Language Specification*: Define a functional programming language that is a subset of an existing language, tailored for efficient Wasm compilation and seamless embedding into other codebases. A subset of the standard library supporting the language features will also be defined.
- *Functioning Compiler*: Develop a fully operational compiler capable of translating the defined functional language into efficient Wasm bytecode for high-performance execution across environments. The compiled code should interoperate with other languages it is embedded into.
- *Language Documentation*: Provide documentation detailing the usage and development of the new language, including examples, references, and demonstrations of embedding into different language codebases to facilitate learning and adoption.

While not production-ready after 7 weeks, the project will serve as a proof of concept and foundation for potential further development by delivering the defined language, compiler, documentation, and embedding examples. Refer to the requirements specification for more details on the objectives @spec_doc.

== Document structure

This document is structured as follows.

- _Introduction_: Provides an overview of the project and its context.
- _Analysis_: Describes the context, objectives, and requirements of the project.
- _Design_: Details the design of the functional language, compiler, and standard library.
- _Implementation_: Explains the implementation of the compiler and standard library.
- _Evaluation_: Discusses the evaluation of the compiler and standard library.
- _Conclusion_: Summarizes the project, highlights achievements, and outlines future work.

#todo("maybe add a chapter about planning and sprints")

= Analysis

This section presents the constraints, the exploration of different technologies and features and the technological choices.

== Choice of language for the subset

In this project, the choice of the language subset is crucial. The language should be expressive enough to demonstrate the functional programming paradigm's benefits while being simple enough to implement within the project's timeframe. The language should also be a subset of an existing language to so that the task of having to specify the language's syntax and semantics is simplified.

The following languages were considered for the project.

#todo("add choice of language subset (specify the Wasm compatibility, the functional features, the standard library)")

=== OCaml

=== F\#

=== Lisp languages

=== BEAM languages

#gls("beam")

=== Haskell

== Choice of compiler technology

The choice of compiler technology is essential for the project's success. The compiler should be able to translate the functional language subset into efficient #glss("wasm") bytecode. The following technologies were considered for the project.

#todo("add choice of compiler technology (specify the Wasm compatibility, the functional features, the standard library)")

=== LLVM

=== Manual translation

== Embedding the Wasm module into a codebase

The embedding of the #glss("wasm") module into a codebase is a crucial aspect of the project. The #glss("wasm") module should be able to interact with the host codebase seamlessly. The following technologies were considered for the project.

#todo("add embedding technologies (specify the Wasm compatibility, the functional features, the standard library), interface types ??? => (https://docs.wasmer.io/wai)")

=== Wasmer

=== Wasmtime

=== Wasmtime with WebAssembly Component Model

== How the GHC Haskell compiler works

== Other technological choices

#todo("add other technological choices")

=== Gitlab

=== Typst

=== Language for the compiler

= Design

This section describes the design of the functional language, compiler, and standard library. It includes the lexical and context-free syntax of the language, the compiler's architecture, and the standard library's design.

#todo("add design of the functional language, compiler, and standard library")

== Lexical syntax

== Context-free syntax

== Compiler architecture

== Language features

== Standard library design

= Implementation

= Evaluation

= Conclusion

== Challenges

== Future work

== Personal opinion
