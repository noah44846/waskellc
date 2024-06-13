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

=== OCaml

OCaml is a general-purpose, multi-paradigm programming language that extends the ML language with object-oriented features. It has a strong type system, automatic memory management, and supports functional, imperative, and object-oriented programming styles. OCaml is widely used in academia and industry, particularly in areas such as theorem proving, compiler development, and systems programming.

Advantages:
- Strong static type system can facilitate efficient compilation and optimization.
- Since OCaml is often used in compiler development, its compiler is well documented and can serve as a reference for the project.
- Already supports #glss("wasm") compilation, which can serve as a reference for the project.

Disadvantages:
- Multi-paradigm nature and complex syntax may complicate the task of creating a purely functional subset.
- OCaml is a vast language with many features, which may make it challenging to define a subset that is both expressive and manageable, given the author's limited experience with the language.

=== F\#

F\# is a multi-paradigm programming language that encompasses functional, imperative, and object-oriented styles. It is a part of the .NET ecosystem and can be seamlessly integrated with other .NET languages such as C\# and Visual Basic. F\# is particularly well-suited for data-oriented programming tasks, parallel programming, and domain-specific language development.

Advantages:
- Seamless integration with the .NET ecosystem and interoperability with other .NET languages.
- Already supports #glss("wasm") compilation through Bolero (which uses Blazor), providing a reference for the project.

Disadvantages:
- Limited adoption and smaller community compared to more popular languages like C\#.
- Multi-paradigm nature may complicate the task of creating a purely functional subset.
- The author is not familiar with F\# and would need to learn the language from scratch.

=== The Lisp languages (Common Lisp, Clojure)

Lisp (List Processing) is a family of programming languages with a long history and a distinctive syntax based on parentheses and lists. Common Lisp and Clojure are two prominent dialects of Lisp.

#heading("Common Lisp", level: 4, numbering: none, outlined: false)

Common Lisp is a multi-paradigm language that supports functional, imperative, and object-oriented programming styles. It is used in artificial intelligence, computer algebra, and symbolic computation applications.

Advantages:
- Very simple and consistent syntax, which makes it easy to define a subset.
- Established language with a rich ecosystem of libraries and tools.

Disadvantages:
- No built-in support for #glss("wasm") compilation, which means there is no reference implementation for the project.
- The author is not familiar with Common Lisp and would need to learn the language from scratch.

#heading("Clojure", level: 4, numbering: none, outlined: false)

Clojure is a modern Lisp dialect that runs on the Java Virtual Machine (JVM) and emphasizes immutable data structures and functional programming. It is designed for concurrent and parallel programming, and is often used in web development and data analysis applications.

Advantages:
- Functional programming paradigm aligned with the project's goals.
- Runs on the JVM, which has existing tooling and libraries for Wasm compilation.
Disadvantages:
- No direct support for #glss("wasm") compilation, which means there is no reference implementation for the project.
- The author has limited experience with Clojure and defining a subset may be challenging.

=== The BEAM languages (Erlang, Elixir)

The Beam languages, Elixir and Erlang, are functional programming languages that run on the Erlang Virtual Machine (BEAM). They are designed for building scalable, fault-tolerant, and distributed systems.

#heading("Erlang", level: 4, numbering: none, outlined: false)

Erlang is a general-purpose, concurrent programming language with built-in support for distributed computing. It is widely used in telecommunications, banking, and e-commerce systems that require high availability and fault tolerance.

Advantages:
- Functional programming paradigm aligned with the project's goals.
- There are alternative compilers for BEAM languages that target #glss("wasm"), which can serve as a reference for the project.
Disadvantages:
- The author has limited experience with Erlang, which may complicate the task of defining a subset.

#heading("Elixir", level: 4, numbering: none, outlined: false)

Elixir is a more recent functional language that builds upon the strengths of Erlang's VM and ecosystem. It aims to provide a more modern and productive syntax while maintaining the robustness and concurrency features of Erlang.

Advantages:
- Functional programming paradigm aligned with the project's goals.
- Elixir has a more modern syntax and tooling compared to Erlang.
- As with Erlang, there are alternative compilers for BEAM languages that target #glss("wasm"), which can serve as a reference for the project.
Disadvantages:
- The author has limited experience with Elixir, which may complicate the task of defining a subset.

=== Haskell

Haskell is a purely functional programming language with a strong static type system and lazy evaluation. It is known for its elegance, conciseness, and expressive type system, which facilitates safe and modular code development.

Haskell's functional paradigm and powerful abstraction mechanisms make it well-suited for a wide range of applications, including data analysis, concurrent and parallel programming, domain-specific language development, and cryptography.

Advantages:
- Purely functional programming paradigm, aligning perfectly with the project's goals.
- Advanced type system can facilitate efficient compilation and optimization.
- Existing tools and libraries for Wasm compilation, such as the Glasgow Haskell Compiler (GHC) and its support for various intermediate representations.
- Author's familiarity with the language can facilitate implementation and understanding of language intricacies.

Disadvantages:
- Lazy evaluation may introduce complexities in the compilation process and performance considerations.
- Limited adoption in industry compared to more mainstream languages, potentially impacting future community support and ecosystem growth.

Considering the project's goals of creating a functional language subset tailored for efficient compilation to WebAssembly (Wasm), Haskell stands out as the most suitable choice. Its purely functional nature, advanced type system, existing tooling for Wasm compilation, and the author's familiarity with the language make it an ideal foundation for this project. Since the project has a limited timeframe of 7 weeks, the choice of a language subset that the author is most comfortable with, is crucial.

Since Haskell is a purely functional language, defining a subset that is both expressive and manageable within the project's timeframe should be feasible. Additionally, the motivation behind the project is to be able to leverage the strengths of functional programming within existing codebases, and Haskell's functional paradigm aligns perfectly with this goal.

While other languages like OCaml, F\#, Lisp dialects, and the Beam languages have their strengths, their multi-paradigm nature or limited direct support for Wasm compilation could introduce additional complexities or hinder the efficient realization of the project's objectives.

== Wasm extensions

Wasm is a stack-based virtual machine designed to execute code at near-native speeds across different environments. It is used in web browsers, server-side applications, and other environments where performance and portability are essential. Wasm bytecode is generated from high-level languages and can be executed on any platform that supports the Wasm runtime.

In its current form, Wasm provides a set of core features that are sufficient for executing code efficiently. However, there are several extensions and proposals that aim to enhance Wasm's capabilities and make it more versatile for different use cases. The following Wasm extensions were considered for the project.

=== Component model

One of the main limitations of Wasm (especially in the context of embedding it into existing codebases) is the small number of types it supports. The component model proposal @wasm_component_model aims to address this limitation by introducing a new language that allows developers to define custom types and interfaces and an ABI for interacting with Wasm modules. This extension could be beneficial for the project as it would enable more seamless integration of the functional language subset into other codebases.

Using this new language, developers can define interfaces using the .wit file format and implement these interfaces in Wasm modules. To use the generated component, bindings need to be created in the host codebase that match the interface defined in the .wit file. This allows the host codebase to interact with the Wasm module using the defined interface.

The problem with this extension is that it is still in the proposal stage and Wasm components can only be run in a few languages (Rust, JavaScript and partially Python) using the Wasmtime runtime. This could limit the project's ability to demonstrate embedding the functional language into different codebases.

@lst_component_model_interface shows an example of an interface using the .wit file format, and @lst_component_model_implementation shows an example of the implementation of the interface in Wasm.

#figure(
  code_block[```
  package example:add;

  world root {
    export add: func(x: s32, y: s32) -> s32;
  }
  ```],
  caption: [Example of a Interface using the .wit file format.],
) <lst_component_model_interface>

#figure(
  code_block[```wast
  (module
    (func (export "example:add/root#add") (param i32) (param i32) (result i32)
      local.get 0
      local.get 1
      i32.add
    )
  )
  ```],
  caption: [Example of the implementation of the Interface.],
) <lst_component_model_implementation>

=== Reference types and function references

The reference types proposal @wasm_ref_types aims to allow for reference types (function references or external references) to be used as values. This extension could be beneficial for the project as it would allow the functional language subset to interact more easily with the host codebase. Additionally since Haskell is a functional language, this extension simplifies the implementation of functions as first-class citizens.

In core Wasm, function references are only used inside function tables (necessary for indirect calls). The reference types proposal extends this to allow function references to be used as values. It introduces new instructions to interact with the function tables to dynamically add and remove functions.

The proposal is still in the proposal stage, but it is supported by the Wasmer, Wasmtime and WasmEdge runtimes and practically everywhere else. This means that the project could leverage these runtimes to demonstrate the embedding of the functional language into different codebases.

The function references proposal @wasm_func_refs is an extension of the reference types proposal that simply enables function references to be called directly. It also makes a distinction between nullable and non-nullable function references. This extension could be beneficial for the project as it simplifies the implementation of functions as first-class citizens even further.

The function references proposal is still in the proposal stage and is less supported than the reference types proposal. It is supported by the Wasmtime and WasmEdge runtimes and in the browser.

@lst_ref_types shows an example of reference types and function references in Wasm.

#figure(
  code_block[```wast
  (module
      (table 1 funcref)
      (type $type0 (func (result i32)))
      (type $type1 (func (param i32) (result i32)))

      (func $foo (result i32) i32.const 42)

      ;; This function calls the function referenced in the table with
      ;; the index returned by "add_func_to_tabel"
      (func $ref_types_example (result i32)
          call $add_func_to_tabel
          call_indirect 0 (type $type0)
      )

      ;; This function adds the function reference to the table and
      ;; returns the index
      (func $add_func_to_tabel (result i32)
          i32.const 0
          ref.func $foo
          table.set 0
          i32.const 0
      )

      ;; This function takes a int and returns it
      (func $bar (param i32) (result i32) local.get 0)

      ;; This function takes a int and calls "call_passed_func" with
      ;; it and the function reference
      (func $func_types_example (param i32) (result i32)
          local.get 0
          ref.func $bar
          call $call_passed_func
      )

      ;; This function takes a int and a function reference and calls
      ;; the function reference with the int
      (func $call_passed_func (param i32) (param (ref $t1)) (result i32)
          local.get 0
          local.get 1
          call_ref $type1
      )
  )
  ```],
  caption: [Example of reference types and function references in Wasm.],
) <lst_ref_types>

=== Garbage collection

The garbage collection proposal @wasm_gc

=== Tail call optimization

== Embedding the Wasm module into a codebase

The embedding of the #glss("wasm") module into a codebase is a crucial aspect of the project. The #glss("wasm") module should be able to interact with the host codebase seamlessly. The following technologies were considered for the project.

#todo("add embedding technologies (specify the Wasm compatibility, the functional features, the standard library), interface types ??? => (https://docs.wasmer.io/wai)")

=== Wasmer

=== Wasmtime

=== WasmEdge

== Choice of compiler technology

The choice of compiler technology is essential for the project's success. The compiler should be able to translate the functional language subset into efficient #glss("wasm") bytecode. The following technologies were considered for the project.

#todo("add choice of compiler technology (specify the Wasm compatibility, the functional features, the standard library)")

=== LLVM

=== Manual translation

=== Binaryen

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

Skipped features:

- irrefutable patterns + pattern bindings
- typed expressions
- holes
- operator stuff ?? (precedence, associativity, fixity, arity > 2 operators / paren func def thing)
  - "(a &\* b) c = ..."

== Compiler architecture

== Language features

== Standard library design

= Implementation

= Evaluation

= Conclusion

== Challenges

== Future work

== Personal opinion
