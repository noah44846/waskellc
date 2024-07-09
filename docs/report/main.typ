// ---------------------------------------------------------------------------
// Copyright © 2024 Haute école d'ingénierie et d'architecture de Fribourg
// SPDX-License-Identifier: Apache-2.0
// ---------------------------------------------------------------------------
// Author : Noah Godel <noah.godel@edu.hefr.ch>
// Date   : 31 May 2024
// ---------------------------------------------------------------------------
// Example of a student reports at the Haute école d'ingénierie et
// d'architecture de Fribourg
// ---------------------------------------------------------------------------

#import "lib/heiafr.typ": report, code_block, glss, glsl
#import "@preview/glossarium:0.4.1": gls, glspl
#import "@preview/big-todo:0.2.0": *
#import "@preview/cetz:0.2.2": canvas, plot
#import "@preview/simplebnf:0.1.0": *

#set text(region: "ch", lang: "en")

// N.B. : The versions array needs to be ordered from the oldest to the newest
#let versions = (
  (
    version: "0.1",
    date: datetime(year: 2024, month: 06, day: 12),
    changes: [First version - introduction and chapter titles],
  ),
  (
    version: "0.2",
    date: datetime(year: 2024, month: 06, day: 19),
    changes: [Analysis section],
  ),
  (
    version: "0.3",
    date: datetime(year: 2024, month: 07, day: 05),
    changes: [Implementation section],
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

#todo_outline

= Introduction

This report documents the development of a functional language compiler to WebAssembly (Wasm). The project was conducted as part of the Bachelor's thesis at the #gls("heiafr"). The goal of the project was to design and implement a compiler for a functional language that targets Wasm. The project was supervised by Dr. Jacques Supcik and Dr. Serge Ayer, with Dr. Baptiste Wicht and Valentin Bourqui as experts. For further details,
please refer to the requirement specification document @spec_doc. The project repository can be found at the following URL.

#align(center)[https://gitlab.forge.hefr.ch/noah.godel/24-tb-wasm-compiler]

== Context

The functional programming paradigm offers advantages for certain types of problems like data transformations, parallel processing, and mathematical computations. However, it has limitations, and many use cases are better suited for imperative or object-oriented programming. Ideally, developers should be able to leverage the strengths of different paradigms within the same codebase. Unfortunately, integrating functional languages into existing codebases written in other languages can be challenging.

Wasm is a bytecode format designed to execute code at near-native speeds across different environments like web browsers and Wasm runtimes. By developing a compiler for a functional language, or in the context of this project, a subset of an existing one, that compiles to Wasm, we can combine functional programming benefits with Wasm's performance and portability. This enables seamless integration of high-performance functional code into codebases of different languages, allowing developers to utilize functional programming strengths for specific components.

The project aims to demonstrate embedding the new functional language compiled to Wasm into existing codebases, showcasing interoperability and the potential for combining paradigms within the same project. For more details on the context, refer to the requirements specification document @spec_doc.

@img_embedding illustrates the concept of embedding a Wasm module into a codebase.

#figure(
  image("img/embedding.png", width: 60%),
  caption: [Illustration of embedding a Wasm module into a codebase.],
) <img_embedding>

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

= Analysis

This section presents the constraints, the exploration of different technologies and features and the technological choices.

== UNESCO and Sustainable Development Goals

The project aligns with the United Nations Educational, Scientific and Cultural Organization (UNESCO) and the Sustainable Development Goals (SDGs) by promoting education, innovation, and sustainable development. By developing a functional language compiler to WebAssembly, the project contributes to the advancement of technology, education, and the digital economy. The project's outcomes can be used to enhance programming education, foster innovation, and support sustainable development initiatives. @un_sdg

The following SDGs are relevant to the project.

=== Goal 4: Quality Education

The project aims to improve the quality of education by providing a new tool for teaching and learning functional programming concepts. By developing a functional language compiler to WebAssembly, the project enables educators to introduce students to functional programming paradigms and demonstrate the benefits of functional programming in real-world applications. The project's outcomes can be used to enhance programming education and prepare students for careers in software development and technology.

In addition, the project enhances educational opportunities in the field of compiler development and programming language design. By providing a hands-on experience in developing a compiler for a functional language, the project equips students with practical skills and knowledge that are valuable in the software industry.

=== Goal 8: Decent Work and Economic Growth

The project contributes to decent work and economic growth by developing a functional language compiler to WebAssembly. By enabling developers to compile functional code to a portable and efficient bytecode format, the project supports the development of new applications and services that can drive economic growth. The project's outcomes can be used to create job opportunities in the software development industry, foster entrepreneurship, and promote innovation in the digital economy.

=== Goal 17: Partnerships for the Goals

The project promotes partnerships for the goals by collaborating with academic institutions, industry experts, and stakeholders in the software development community. By working with supervisors, experts, and external partners, the project leverages diverse expertise and resources to achieve its objectives. The project's outcomes can be shared with the wider community to promote knowledge sharing, collaboration, and the advancement of technology and education.

== Choice of language for the subset

In this project, the choice of the language subset is crucial. The language should be expressive enough to demonstrate the functional programming paradigm's benefits while being simple enough to implement within the project's timeframe. The language should also be a subset of an existing language to so that the task of having to specify the language's syntax and semantics is simplified.

The following languages were considered for the project.

=== OCaml

OCaml is a general-purpose, multi-paradigm programming language that extends the ML language with object-oriented features. It has a strong type system, automatic memory management, and supports functional, imperative, and object-oriented programming styles. OCaml is widely used in academia and industry, particularly in areas such as theorem proving, compiler development, and systems programming.

Advantages:
- Strong static type system can facilitate efficient compilation and optimization.
- Since OCaml is often used in compiler development, its compiler is well documented and can serve as a reference for the project.
- Already supports Wasm compilation, which can serve as a reference for the project.

Disadvantages:
- Multi-paradigm nature and complex syntax may complicate the task of creating a purely functional subset.
- OCaml is a vast language with many features, which may make it challenging to define a subset that is both expressive and manageable, given the author's limited experience with the language.

=== F\#

F\# is a multi-paradigm programming language that encompasses functional, imperative, and object-oriented styles. It is a part of the .NET ecosystem and can be seamlessly integrated with other .NET languages such as C\# and Visual Basic. F\# is particularly well-suited for data-oriented programming tasks, parallel programming, and domain-specific language development.

Advantages:
- Seamless integration with the .NET ecosystem and interoperability with other .NET languages.
- Already supports Wasm compilation through Bolero (which uses Blazor), providing a reference for the project.

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
- No built-in support for Wasm compilation, which means there is no reference implementation for the project.
- The author is not familiar with Common Lisp and would need to learn the language from scratch.

#heading("Clojure", level: 4, numbering: none, outlined: false)

Clojure is a modern Lisp dialect that runs on the Java Virtual Machine (JVM) and emphasizes immutable data structures and functional programming. It is designed for concurrent and parallel programming, and is often used in web development and data analysis applications.

Advantages:
- Functional programming paradigm aligned with the project's goals.
- Runs on the JVM, which has existing tooling and libraries for Wasm compilation.

Disadvantages:
- No _direct_ support for Wasm compilation, which means there is no reference implementation for the project.
- The author has limited experience with Clojure and defining a subset may be challenging.

=== The BEAM languages (Erlang, Elixir)

The Beam languages, Elixir and Erlang, are functional programming languages that run on the Erlang Virtual Machine (BEAM). They are designed for building scalable, fault-tolerant, and distributed systems.

#heading("Erlang", level: 4, numbering: none, outlined: false)

Erlang is a general-purpose, concurrent programming language with built-in support for distributed computing. It is widely used in telecommunications, banking, and e-commerce systems that require high availability and fault tolerance.

Advantages:
- Functional programming paradigm aligned with the project's goals.
- There are alternative compilers for BEAM languages that target Wasm, which can serve as a reference for the project.

Disadvantages:
- The author has limited experience with Erlang, which may complicate the task of defining a subset.

#heading("Elixir", level: 4, numbering: none, outlined: false)

Elixir is a more recent functional language that builds upon the strengths of Erlang's VM and ecosystem. It aims to provide a more modern and productive syntax while maintaining the robustness and concurrency features of Erlang.

Advantages:
- Functional programming paradigm aligned with the project's goals.
- Elixir has a more modern syntax and tooling compared to Erlang.
- As with Erlang, there are alternative compilers for BEAM languages that target Wasm, which can serve as a reference for the project.

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
- Haskell's advanced type system may require additional effort to define a subset that is both expressive and manageable within the project's timeframe.

Considering the project's goals of creating a functional language subset tailored for efficient compilation to WebAssembly (Wasm), Haskell stands out as the most suitable choice. Its purely functional nature, advanced type system, existing tooling for Wasm compilation, and the author's familiarity with the language make it an ideal foundation for this project. Since the project has a limited timeframe of 7 weeks, the choice of a language subset that the author is most comfortable with, is crucial.

Since Haskell is a purely functional language, defining a subset that is both expressive and manageable within the project's timeframe should be feasible. Additionally, the motivation behind the project is to be able to leverage the strengths of functional programming within existing codebases, and Haskell's functional paradigm aligns perfectly with this goal. Since November 2022, GHC has supported the compilation of Haskell code to WebAssembly. This means that the project can use GHC as a reference for the compilation process.

While other languages like OCaml, F\#, Lisp dialects, and the Beam languages have their strengths, their multi-paradigm nature or limited direct support for Wasm compilation could introduce additional complexities or hinder the efficient realization of the project's objectives.

== The functional paradigm

The functional programming paradigm is based on the concept of functions as first-class citizens, immutability, and the absence of side effects. Functional programming languages treat computation as the evaluation of mathematical functions and emphasize declarative programming styles. The functional paradigm offers several advantages, including:

- *Modularity*: Functions are modular and composable, enabling code reuse and maintainability.
- *Conciseness*: Functional languages often require less code to express complex operations compared to imperative languages.
- *Safety*: Immutability and strong type systems reduce the likelihood of runtime errors and make code easier to reason about.
- *Parallelism*: Functional programming encourages pure functions, which are inherently thread-safe and can be executed in parallel without side effects.
- *Higher-order functions*: Functions can take other functions as arguments or return functions as results, enabling powerful abstractions and expressive code.
- *Declarative style*: Functional programming focuses on what should be computed rather than how, leading to more readable and maintainable code.

In the following sections, some key features of the functional programming paradigm that are relevant to the project will be discussed.

=== Partial application and currying

Partial application and currying are common techniques in functional programming that involve creating new functions by applying a function to some of its arguments. Partial application involves supplying fewer arguments than the function expects, while currying involves transforming a function that takes multiple arguments into a series of functions that each take a single argument.

In Haskell, functions are curried by default, which means that all functions take exactly one argument and return a new function that takes the next argument. This allows for partial application and function composition, enabling powerful abstractions and expressive code. As we can see, in @lst_currying, the type signature of the `add` function indicates that it takes an `Int` and returns a function that takes another `Int` and returns an `Int`. A good real-world example of currying is the `map` function in Haskell, which takes a function and a list and applies the function to each element of the list. If we want to increment each element of a list by 1, we can use partial application to pass a function that increments each element (see @lst_currying).

As a side note, function application in Haskell is done by separating the function name from its arguments with whitespace, for example, `add 1 2`. This is different from most other programming languages, where parentheses are used for function application, for example, `add(1, 2)`.

#figure(
  code_block[```haskell
  add :: Int -> Int -> Int
  add x y = x + y

  -- map :: (a -> b) -> [a] -> [b]
  -- add 1 :: Int -> Int
  incrementList :: [Int] -> [Int]
  -- the list argument can be omitted because of partial application ->
  -- the function returns a new function that corresponds to the function signature
  incrementList = map (add 1)
  ```],
  caption: [Example of currying in Haskell.],
) <lst_currying>

Haskell has some helper functions that can be used to create curried functions from uncurried functions and vice versa. For example, the `curry` function takes an uncurried function and returns a curried function, while the `uncurry` function takes a curried function and returns an uncurried function. @lst_currying_helpers shows an example of using the `curry` and `uncurry` functions in Haskell. Uncurried functions in Haskell are functions that take a tuple as an argument. @lst_currying_helpers shows an example of using the `curry` and `uncurry` functions.

#figure(
  code_block[```haskell
  -- curry :: ((a, b) -> c) -> a -> b -> c
  -- uncurry :: (a -> b -> c) -> (a, b) -> c

  addUncurried :: (Int, Int) -> Int
  -- pattern matching on a tuple
  addUncurried (x, y) = x + y

  addCurried :: Int -> Int -> Int
  addCurried = curry addUncurried

  addUncurried' :: (Int, Int) -> Int
  addUncurried' = uncurry addCurried
  ```],
  caption: [Example of currying helpers in Haskell.],
) <lst_currying_helpers>

=== Algebraic data types

Algebraic data types are a fundamental concept in functional programming that allows developers to define complex data structures using simple building blocks. There are two main types of algebraic data types: sum types and product types. Sum types represent a choice between different alternatives, while product types represent a combination of different values.

In Haskell, algebraic data types are defined using the `data` keyword. For example, the `Boolean` type is a sum type that represents a value that may or may not be present. @lst_algebraic_data_types shows an example of the `Boolean` type definition in Haskell, which consists of two alternatives: `True` and `False`.

The `List` type is another example of an algebraic data type that represents a list of values. It is defined as a sum type with two alternatives: an empty list `Nil` and a cons cell `Cons a List`. This definition allows for recursive data structures, such as linked lists, trees, and graphs. This data structure also shows that, in Haskell, sum types and product types can be combined to create more complex data structures, the `Cons` constructor is a product type that combines a value `a` with another list `List a`. The `a` type variable is a type parameter that allows the `List` type to be polymorphic and store values of any type. @lst_algebraic_data_types shows an example of the `List` type definition in Haskell.

#figure(
  code_block[```haskell
  data Boolean = True | False

  data List a = Nil | Cons a (List a)
  ```],
  caption: [Example of an algebraic data type in Haskell.],
) <lst_algebraic_data_types>

=== Pattern matching

Pattern matching is a powerful feature in functional programming that allows developers to destructure data structures and extract values based on their shape. It is often used in conjunction with algebraic data types to define functions that operate on different alternatives of a sum type.

In Haskell, pattern matching is achieved using the `case` expression or function definitions with pattern matching clauses. The `Boolean` type definition from @lst_algebraic_data_types can be used to define a function that negates a boolean value. The function `negateBoolean` pattern matches on the `Boolean` type and returns the opposite value. @lst_pattern_matching shows an example of the `negateBoolean` function in Haskell.

The `List` type definition from @lst_algebraic_data_types can be used to define a function that calculates the length of a list. The `length` function pattern matches on the `List` type and recursively calculates the length of the list. @lst_pattern_matching shows an example of the `length` function in Haskell. As we can see, pattern matching allows for capturing values from different alternatives of a sum type and defining functions that operate on these values like the `xs` in the `Cons` alternative of the `List` type (the `_` is a wildcard pattern that matches any values without binding them).

#figure(
  code_block[```haskell
  negateBoolean :: Boolean -> Boolean
  negateBoolean b = case b of
    True -> False
    False -> True

  -- or using pattern matching in function definitions
  negateBoolean' :: Boolean -> Boolean
  negateBoolean' True = False
  negateBoolean' False = True

  length :: List a -> Int
  length Nil = 0
  length (Cons _ xs) = 1 + length xs
  ```],
  caption: [Example of pattern matching in Haskell.],
) <lst_pattern_matching>

=== Parametric polymorphism

Parametric polymorphism is a feature of functional programming languages that allows developers to write generic functions that operate on values of any type. It is achieved by introducing type variables that represent unknown types and can be instantiated with concrete types when the function is used. All type variables are universally quantifie, meaning that they can represent any type. When defining a function with type variables, the function needs to be correct for all possible types that the type variables can represent (because the type variables are universally quantified). So a function that has 2 type variables but these type variables are always the same type, the function won't compile. The `foo` function in @lst_parametric_polymorphism is an example of a parametrically polymorphic function in Haskell that doesn't compile.

In Haskell, parametric polymorphism is achieved using type variables in function signatures. For example, the `id` function is a parametrically polymorphic function that takes a value of any type and returns the same value. The `id` function is defined as `id :: a -> a`, where `a` is a type variable that can represent any type. The `id` function is a common example of a parametrically polymorphic function that demonstrates the power of type variables in functional programming. @lst_parametric_polymorphism shows an example of the `id` function in Haskell.

@lst_parametric_polymorphism shows examples of parametric polymorphism in Haskell.

#figure(
  code_block[```haskell
  -- doesn't compile because the type variables are different
  foo :: a -> b -> a
  foo x y = x

  id :: a -> a
  id x = x

  const :: a -> b -> a
  const x _ = x
  ```],
  caption: [Example of parametric polymorphism in Haskell.],
) <lst_parametric_polymorphism>

=== Higher-order functions

Higher-order functions are functions that take other functions as arguments or return functions as results. They are a fundamental concept in functional programming that enables powerful abstractions and expressive code. Higher-order functions allow developers to write generic functions that can be customized with different behaviors by passing functions as arguments.

In Haskell, higher-order functions are used extensively to create composable and reusable code. For example, the `map` (used in @lst_currying) and `filter` functions are higher-order functions that take a function and a list and apply the function to each element of the list or filter the list based on the function's result. The `map` function is a common example of a higher-order function that demonstrates the power of functional programming. @lst_higher_order_functions shows an example of the `map` function in Haskell. The first argument of the `map` function is a function that takes an `a` and returns a `b`, and the second argument is a list of `a` values. The `map` function applies the function to each element of the list and returns a list of `b` values.

#figure(
  code_block[```haskell
  map :: (a -> b) -> List a -> List b
  map _ Nil = Nil
  map f (Cons x xs) = Cons (f x) (map f xs)
  ```],
  caption: [Example of a higher-order function in Haskell.],
) <lst_higher_order_functions>

=== Lazy evaluation

Lazy evaluation is a feature of functional programming languages that delays the evaluation of expressions until their results are actually needed. This can lead to more efficient use of resources and enable the creation of infinite data structures. In Haskell, all expressions are lazily evaluated by default, which means that functions only evaluate their arguments when the arguments are needed to produce a result.

The only way to force the evaluation of an expression in Haskell is through pattern matching or through the evaluation of the `main` function (there are other ways but they are not relevant for this project). This can lead to more efficient code execution and resource usage, as only the necessary parts of the program are evaluated when needed. However, lazy evaluation can also introduce complexities in reasoning about the order of evaluation and performance considerations.

@lst_lazy_evaluation shows an example of lazy evaluation in Haskell. The `repeat` function creates an infinite list of the same value by recursively consing the value to the rest of the list. The `take` function takes a number `n` and a list and returns the first `n` elements of the list. When we call `take 5 (repeat 1)`, Haskell only evaluates the first 5 elements of the infinite list, demonstrating the power of lazy evaluation.

#figure(
  code_block[```haskell
  repeat :: a -> List a
  repeat x = Cons x (repeat x)

  take :: Int -> List a -> List a
  take 0 _ = Nil
  take n Nil = Nil
  take n (Cons x xs) = Cons x (take (n - 1) xs)

  list :: List Int
  list = take 5 (repeat 1)
  -- list = Cons 1 (Cons 1 (Cons 1 (Cons 1 (Cons 1 Nil))))
  ```],
  caption: [Example of lazy evaluation in Haskell.],
) <lst_lazy_evaluation>

Internally, the GHC (Glasgow Haskell Compiler) uses a technique called graph reduction to evaluate expressions lazily. This technique represents expressions as graphs of nodes and edges, where each node represents a value and each edge represents a reference to another node. When an expression is evaluated, the graph is traversed and nodes are evaluated as needed. This allows for sharing of common subexpressions and efficient memory usage. So as an added bonus, no expression is evaluated more than once.

Since this technique is not trivial to implement by hand in Wasm, a more naive approach will be used in the project. This approach will treat every function application as a new closure and will not share common subexpressions. This will lead to less efficient memory usage and potentially slower execution times, but it will simplify the implementation of the compiler. These closures will be stored evaluated in only when needed.

=== Added challenges of implementing a functional language

Implementing a functional language subset that targets Wasm presents several challenges that need to be addressed during the design and implementation phases of the project. Some of the key challenges compared to implementing an imperative language include:

- *Higher-order functions*: Supporting higher-order functions, which are functions that take other functions as arguments or return functions as results, requires careful handling of function closures and environments.
- *Lazy evaluation*: Implementing lazy evaluation, where expressions are only evaluated when their results are needed, can introduce complexities in the compilation process and runtime behavior.
- *Garbage collection*: Managing memory and resource cleanup in a functional language that supports immutable data structures and higher-order functions requires an efficient garbage collection mechanism.
- *Tail call optimization*: Ensuring that tail-recursive functions are optimized to avoid stack overflows and improve performance is essential for functional programming languages since recursion is a common pattern.
- *Parametric polymorphism*: Supporting parametric polymorphism, which allows developers to write generic functions that operate on values of any type, requires careful handling of type variables and type inference. This language feature is very important for the project because without it, the language would be very limited in its expressiveness.

== Wasm extensions

Wasm is a stack-based virtual machine designed to execute code at near-native speeds across different environments. It is used in web browsers, server-side applications, and other environments where performance and portability are essential. Wasm bytecode is generated from high-level languages and can be executed on any platform that supports the Wasm runtime.

In its current form, Wasm provides a set of core features that are sufficient for executing code efficiently. However, there are several extensions and proposals that aim to enhance Wasm's capabilities and make it more versatile for different use cases. The following Wasm extensions were considered for the project.

=== Component model

One of the main limitations of Wasm (especially in the context of embedding it into existing codebases) is the small number of types it supports (essentially integers and floats). The component model proposal @wasm_component_model aims to address this limitation by introducing a new language that allows developers to define custom types and interfaces and an ABI for interacting with Wasm modules. This extension could be beneficial for the project as it would enable more seamless integration of the functional language subset into other codebases.

Using this new language, developers can define interfaces using the .wit file format and implement these interfaces in Wasm modules. To use the generated component, bindings need to be generated in the host codebase that match the interface, its types and functions that are defined in the .wit file. This allows the host codebase to interact with the Wasm component using the defined interface.

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

The reference types proposal @wasm_ref_types aims to allow for reference types (function references or external references) to be used as values. This extension could be beneficial for the project since this extension simplifies the implementation of functions as first-class citizens.

In core Wasm, function references are only used inside function tables (necessary for indirect calls). The reference types proposal extends this to allow function references to be used as values in the functions themselves and not only as indices into the function table. It also introduces new instructions to interact with the function table to dynamically add and remove functions from it.

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
          call_indirect (type $type0)
      )

      ;; This function adds the function reference to the table and
      ;; returns the index
      (func $add_func_to_tabel (result i32)
          ref.func $foo
          i32.const 0
          table.set 0
          i32.const 0
      )

      ;; this function takes a int and returns it
      (func $bar (param i32) (result i32)
          local.get 0
      )

      ;; This function takes a int and calls "call_passed_func" with
      ;; it and the function reference
      (func $func_types_example (param i32) (result i32)
          ref.func $bar
          local.get 0
          call $call_passed_func
      )

      ;; This function takes a int and a function reference and calls
      ;; the function reference with the int
      (func $call_passed_func (param i32) (param (ref $t1)) (result i32)
          local.get 1
          local.get 0
          call_ref $type1
      )
  )
  ```],
  caption: [Example of reference types and function references in Wasm.],
) <lst_ref_types>

=== Garbage collection

The garbage collection proposal @wasm_gc aims to introduce garbage collection support in Wasm. This extension could be beneficial for the project as it would simplify memory management and resource cleanup in the functional language subset. It is a quite complex proposal and is still in the proposal stage. Since the support for garbage collection in Wasm is as of now limited to the browser and node.js, this could limit the project's ability to demonstrate embedding the functional language into different codebases.

The proposal bases itself on the reference types and function references proposals and introduces new types (so-called heap types) like structs, arrays, and references to these types. It also introduces new instructions to allocate and modify these types on the heap.

=== Tail call optimization

The tail call optimization proposal @wasm_tail_call aims to introduce tail call optimization support in Wasm. This extension could be beneficial for the project as it would optimize the performance of recursive functions in the functional language subset. The proposal is still in the proposal stage and is supported by the Wasmtime and WasmEdge runtimes and practically everywhere else.

@lst_tail_call shows an example of tail call optimization in Wasm.

#figure(
  code_block[```wast
  (module
      (func $factorial (param $x i64) (result i64)
          (return (call $factorial_aux (local.get $x) (i64.const 1)))
      )

      (func $factorial_aux (param $x i64) (param $acc i64) (result i64)
          (if (i64.eqz (local.get $x))
              (then (return (local.get $acc)))
              (else
                  (return
                      (call $factorial_aux
                          (i64.sub (local.get $x) (i64.const 1))
                          (i64.mul (local.get $x) (local.get $acc))
                      )
                  )
              )
          )
          unreachable
      )

      (func $factorial_tail (param $x i64) (result i64)
          (return_call $factorial_tail_aux (local.get $x) (i64.const 1))
      )

      (func $factorial_tail_aux (param $x i64) (param $acc i64) (result i64)
          (if (i64.eqz (local.get $x))
              (then (return (local.get $acc)))
              (else
                  (return_call $factorial_tail_aux
                      (i64.sub (local.get $x) (i64.const 1))
                      (i64.mul (local.get $x) (local.get $acc))
                  )
              )
          )
          unreachable
      )
      (export "factorial" (func $factorial))
      (export "factorial_tail" (func $factorial_tail))
  )
  ```],
  caption: [Example of tail call optimization in Wasm.],
) <lst_tail_call>

@lst_tail_call_performance shows a performance comparison between a factorial function with and without tail call optimization.

#figure(
  code_block[```
  factorial(20): 2432902008176640000 in 12.41µs
  factorial_tail(20): 2432902008176640000 in 1.319µs
  ```],
  caption: [Example of tail call optimization performance comparison.],
) <lst_tail_call_performance>

== Embedding the Wasm module into a codebase

The embedding of the Wasm module into a codebase is a crucial aspect of the project. The Wasm module should be able to interact with the host codebase seamlessly.

Since Wasm is originally designed to run in web browsers, the embedding of Wasm modules into web applications is well supported. However, embedding Wasm modules into other codebases, such as server-side applications or desktop applications, can be more challenging. To be able to interact with the Wasm module, the host codebase needs a runtime that can load and execute the Wasm module (see @img_embedding). The runtime should also provide mechanisms for passing data between the host codebase and the Wasm module.

The following technologies were considered for the project.

=== Wasmer

Wasmer s a standalone Wasm runtime that supports running Wasm modules outside the browser. It provides a set of APIs for loading and executing Wasm modules, as well as mechanisms for interacting with the host codebase. Wasmer also has a registry of Wasm modules that can be used to share and distribute Wasm modules. These modules can also be deployed one the cloud using Wasmer's cloud service.

However, Wasmer does supports the least amount of Wasm proposals out of the three runtimes (see @tbl_wasm_proposal_compatibility), which could limit the project's ability to demonstrate seamless embedding the functional language into different codebases.

On the other hand, Wasmer provides a large set of SDKs for different programming languages (see @tbl_wasm_language_support @wasmer_sdks). Compared to the other runtimes Wasmer has the most extensive support for different programming languages. Which is important for the project since the functional language subset should be able to be embedded into different codebases.

=== Wasmtime

As with Wasmer, Wasmtime is a standalone Wasm runtime that supports running Wasm modules outside the browser. It is developed by the Bytecode Alliance, a group of companies and individuals working on WebAssembly and related technologies. To see the full list supported Wasm proposals see @tbl_wasm_proposal_compatibility @wasmtime_sdks and for the supported programming languages see @tbl_wasm_language_support.

Wasmtime is the only runtime that supports the component model proposal, which could be beneficial for greatly simplifying the embedding of the functional language into different codebases.

=== WasmEdge

As with the other runtimes, WasmEdge is a standalone Wasm runtime that supports running Wasm modules outside the browser. It is developed by the Second State, a company that provides a platform for building and deploying Wasm applications. WasmEdge supports almost all Wasm proposals (see @tbl_wasm_proposal_compatibility @wasmedge_proposals). It achieves this by running JavaScript code in a sandboxed environment and can so support the browser's implementation of Wasm.

However, WasmEdge supportes fewer programming languages than Wasmer and Wasmtime (see @tbl_wasm_language_support @wasmedge_sdks). This could limit the project's ability to demonstrate embedding the functional language into different codebases.

=== Wasm proposal compatibility and language support

@tbl_wasm_proposal_compatibility shows a summary of the compatibility of the Wasm proposals with the different runtimes @wasm_features.

#figure(
  table(
    columns: 5,
    inset: 6pt,
    stroke: none,
    align: (left, center, center, center, center),
    table.header([*Proposal*], [*Wasmer*], [*Wasmtime*], [*WasmEdge*], [*Browser*]),
    table.hline(stroke: 1pt),
    table.vline(stroke: 1pt, x: 1),
    [Reference types], [\u{2713}], [\u{2713}], [\u{2713}], [\u{2713}],
    table.hline(stroke: 0.5pt),
    [Function references], [\u{d7}], [\u{2713}], [\u{2713}], [\u{2713}],
    table.hline(stroke: 0.5pt),
    [Garbage collection], [\u{d7}], [\u{d7}], [\u{2713}], [\u{2713}],
    table.hline(stroke: 0.5pt),
    [Tail call optimization], [\u{d7}], [\u{2713}], [\u{2713}], [\u{2713}],
  ),
  caption: [Summary of Wasm proposal compatibility with different runtimes.],
) <tbl_wasm_proposal_compatibility>

@tbl_wasm_language_support shows a summary of the language support of the different runtimes @wasm_features.

#figure(
  table(
    columns: 4,
    inset: 6pt,
    stroke: none,
    align: (left, center, center, center, center),
    table.header([*Language*], [*Wasmer*], [*Wasmtime*], [*WasmEdge*]),
    table.hline(stroke: 1pt),
    table.vline(stroke: 1pt, x: 1),
    [Rust], [\u{2713}], [\u{2713}], [\u{2713}],
    table.hline(stroke: 0.5pt),
    [C/C++], [\u{2713}], [\u{2713}], [\u{2713}],
    table.hline(stroke: 0.5pt),
    [.NET (C\#, F\#, VB)], [\u{2713}], [\u{2713}], [\u{d7}],
    table.hline(stroke: 0.5pt),
    [D], [\u{2713}], [\u{d7}], [\u{d7}],
    table.hline(stroke: 0.5pt),
    [Python], [\u{2713}], [\u{2713}], [\u{2713}],
    table.hline(stroke: 0.5pt),
    [JavaScript], [\u{2713}], [\u{d7}], [\u{d7}],
    table.hline(stroke: 0.5pt),
    [Go], [\u{2713}], [\u{2713}], [\u{2713}],
    table.hline(stroke: 0.5pt),
    [PHP], [\u{2713}], [\u{d7}], [\u{d7}],
    table.hline(stroke: 0.5pt),
    [Ruby], [\u{2713}], [\u{2713}], [\u{d7}],
    table.hline(stroke: 0.5pt),
    [Java], [\u{2713}], [\u{d7}], [\u{2713}],
    table.hline(stroke: 0.5pt),
    [R], [\u{2713}], [\u{d7}], [\u{d7}],
    table.hline(stroke: 0.5pt),
    [Postgres], [\u{2713}], [\u{d7}], [\u{d7}],
    table.hline(stroke: 0.5pt),
    [Swift], [\u{2713}], [\u{d7}], [\u{d7}],
    table.hline(stroke: 0.5pt),
    [Zig], [\u{2713}], [\u{d7}], [\u{d7}],
    table.hline(stroke: 0.5pt),
    [Dart], [\u{2713}], [\u{d7}], [\u{d7}],
    table.hline(stroke: 0.5pt),
    [Crystal], [\u{2713}], [\u{d7}], [\u{d7}],
    table.hline(stroke: 0.5pt),
    [Common Lisp], [\u{2713}], [\u{d7}], [\u{d7}],
    table.hline(stroke: 0.5pt),
    [Julia], [\u{2713}], [\u{d7}], [\u{d7}],
    table.hline(stroke: 0.5pt),
    [V], [\u{2713}], [\u{d7}], [\u{d7}],
    table.hline(stroke: 0.5pt),
    [OCaml], [\u{2713}], [\u{d7}], [\u{d7}],
    table.hline(stroke: 0.5pt),
    [Elixir], [\u{d7}], [\u{2713}], [\u{d7}],
    table.hline(stroke: 0.5pt),
    [Perl], [\u{d7}], [\u{2713}], [\u{d7}],
  ),
  caption: [Summary of language support of different runtimes.],
) <tbl_wasm_language_support>

== Choice of compiler technology

The choice of compiler technology is essential for the project's success. The compiler should be able to translate the functional language subset into efficient Wasm bytecode. The following technologies were considered for the project.

=== LLVM

LLVM is a collection of modular and reusable compiler and toolchain technologies. It is widely used in industry and academia for developing compilers, static analysis tools, and runtime environments. LLVM provides a set of libraries and tools for building compilers, including a compiler front-end (Clang), a compiler back-end (LLVM Core), and a set of optimization passes.

By making a compiler front-end that translates the functional language subset into LLVM intermediate representation (IR), the project could leverage LLVM's existing infrastructure for optimizing and generating efficient machine code. The LLVM IR can then be translated into Wasm bytecode using the Binaryen toolchain. Additionally targeting LLVM IR would allow the project to compile the functional language to other targets like x86, ARM, or RISC-V.

However, LLVM's complexity and the learning curve associated with it could make it challenging to implement within the project's timeframe. The project would also need to define a subset of the functional language that can be efficiently translated into LLVM IR.

Advantages:
- Efficient optimization and code generation capabilities.
- Support for multiple targets and architectures.
- Existing infrastructure for building compilers and toolchains.

Disadvantages:
- Complexity and learning curve associated with LLVM.
- Need to define a subset of the functional language that can be efficiently translated into LLVM IR.

=== Manual translation

Manual translation refers to the process of writing a custom compiler that directly translates the functional language subset into Wasm bytecode without using an intermediate representation like LLVM IR. This approach would involve defining a custom compiler architecture that parses the functional language syntax, performs semantic analysis, and generates Wasm bytecode.

While manual translation provides full control over the compilation process and allows for tailoring the compiler to the project's specific requirements, it can be time-consuming and error-prone. The project would need to implement lexing, parsing, type checking, and code generation from scratch.

Advantages:
- Full control over the compilation process (e.g., Wasm proposal compatibility, embedded runtime support, etc.).
- Tailoring the compiler to the project's specific requirements.
Disadvantages:
- Time-consuming and error-prone implementation.
- No existing infrastructure for optimization and code generation.

This approach was chosen for the project due to the limited timeframe and the need for a simple and manageable compiler architecture. The manual translation approach allows for a more straightforward implementation of the compiler while focusing on the functional language subset's core features and efficient Wasm compilation. To circumvent the lack of optimization and code generation infrastructure, the project will use the "wasm-opt" tool of the Binaryen toolchain to optimize the generated Wasm bytecode.

== Possible approaches to the compiler architecture

The project could use different approaches to the compiler architecture, depending on the choice of compiler technology.

The project could use the GHC Haskell compiler as a frontend or backend for the functional language subset. The GHC compiler provides a robust infrastructure for parsing, type checking, and optimizing Haskell code, which could be leveraged to translate the functional language subset into efficient Wasm bytecode. By using GHC as a backend, the project could focus on defining the functional language subset and leveraging GHC's existing infrastructure for compilation and optimization. If GHC is used as a frontend, the project would need to define a custom compiler backend that translates the GHC IR into Wasm bytecode.

However, using GHC as a backend or frontend for the project could introduce complexities and dependencies that may not be necessary for the project's scope. It is difficult to extract the necessary parts of GHC for the project and integrate them into the compiler architecture given the size and complexity of the GHC codebase.

Considering the limited timeframe and the need for a simple and manageable compiler architecture, the project will use a manual translation approach to implement the compiler for the functional language subset. This approach allows for a more straightforward implementation of the compiler while focusing on the core features of the functional language subset and efficient Wasm compilation.

The architecture of GHC can still be used as a reference for the project's compiler architecture. The following section describes the compilation process in GHC and how the Haskell compiler works.

== How the GHC Haskell compiler works

This chapter is inspired by notes from a lecture on the GHC compiler at Stanford University @ghc_compiler.

The Glasgow Haskell Compiler (GHC) is the most widely used Haskell compiler and provides a reference implementation for the Haskell language. GHC translates Haskell source code into intermediate representations (IRs) and eventually into machine code. The compilation process in GHC involves several stages, each performing specific tasks to optimize and generate efficient code.

In summary, the compilation process in GHC consists of the following stages (see @fig_ghc_compiler):
+ First the Haskell source code typed checked and desugared into a simplified intermediate representation (Core). This representation is very similar to the original Haskell code but all syntactical constructs are removed or transformed into only let and case statement. All pattern matching definitions for functions are also reduced to a lambda abstraction with a case statement. This enables to simplify the code and make it easier to optimize. The places where allocations take place (let bindings) and the place expressions get evaluated (case statements) are more clear to see and it is easier to reason about the execution order of the program.
+ The Core representation is then optimized using a set of optimization passes. These passes include inlining, constant folding, dead code elimination, and other optimizations that aim to improve the performance of the code. The optimizations are applied in a sequence of passes, each pass transforming the Core representation to a more optimized version.
+ The optimized Core representation is then translated into a lower-level intermediate representation called STG (Spineless Tagless G-machine). The STG representation is closer to the actual execution model of the Haskell runtime system and provides a more detailed view of the program's evaluation. In this representation the allocations only take place in the let bindings and evaluation only takes place in the case statements. The difference to the Core representation is that the STG representation is more detailed and provides more information about the evaluation order of the program, e.g. function application are represented as a thunk (a closure that takes no arguments) that gets evaluated when needed.
+ The STG representation is further optimized using a set of machine-independent optimizations. The optimizations are applied in a sequence of passes, each pass transforming the STG representation to a more optimized version.
+ The optimized STG representation is then translated into a lower-level intermediate representation called Cmm (C minus minus). The Cmm representation is a low-level imperative language that closely resembles the actual machine code that will be generated. In this representation, the program is represented as a sequence of instructions that manipulate memory and perform computations.
+ The Cmm representation is further optimized using a set of machine-dependent optimizations. Compiler backends can then generate efficient machine code for the target architecture, C code, or LLVM IR.

#figure(
  image("img/ghc_compiler.png", width: 60%),
  caption: [Compilation process in the GHC Haskell compiler (taken form the lecture @ghc_compiler).],
) <fig_ghc_compiler>

=== Other similar projects

The following projects are similar to the project and provide insights into the design and implementation of compilers for functional languages. These projects illustrate that this kind of project is feasible and can be implemented within a reasonable timeframe.

#heading("Asterius", level: 4, numbering: none, outlined: false)

Asterius is a Haskell-to-WebAssembly compiler that translates Haskell source code into WebAssembly bytecode. The project has been archived since 2022 and the project is no longer maintained because Wasm compilation is now supported by GHC. The project was used as a reference for the project's compiler architecture. @asterius_compiler

Asterius supports FFI (Foreign Function Interface) for interacting with JavaScript code and provides mechanisms for passing data between Haskell and JavaScript. It can be run in the Browser and Node.js and also supports Promises.

Since the project is a compiler for Haskell and not a subset of Haskell, it is more complex than the project's compiler needs to be. The project will use a simpler architecture that directly translates the functional language subset into Wasm bytecode, so it can be more easily understood and implemented within the project's timeframe.

#heading("Wisp", level: 4, numbering: none, outlined: false)

Wisp is a Lisp-like language that compiles to WebAssembly implemented in Zig. This project is also no longer maintained. The language is similar to Common Lisp and provides a set of features for interactive development and debugging. @wisp_compiler

== Other technological choices

The following technological choices were made for the project.

=== Gitlab

Gitlab is a web-based DevOps lifecycle tool that provides a Git repository manager providing wiki, issue-tracking, and CI/CD pipeline features. It is widely used in industry and academia for managing software projects and collaborating on code development. In the context of the project, Gitlab will be used to host the project's source code, issue-tracking, documentation, and CI/CD pipelines. The CI/CD pipelines in Gitlab will be used to automate the linting, testing, and deployment of the build artifacts.

=== Typst

The documentation for the project will be written in Typst, a typesetting system that allows for the creation of structured documents designed to be a modern alternative to LaTeX. Typst provides a simple and intuitive syntax for writing documents, including support for figures, tables, code blocks, a package ecosystem, and mathematical expressions.

Mr. Supcik provided a template for the project's documentation, which includes a title page, table of contents, list of figures, list of tables, a header and footer, and a bibliography. The author introduced a glossary, a syntax file for the Wasm text format to enable syntax highlighting, and some styling changes to the template.

=== Language for the compiler

Rust is a systems programming language that focuses on safety, speed, and concurrency. It is widely used in industry and academia for developing high-performance software, operating systems, and embedded systems. Rust's memory safety features, zero-cost abstractions, and modern tooling make it an ideal choice for implementing the compiler for the functional language subset.

Rust also has great support for WebAssembly and all its runtime environments. The Rust compiler can target WebAssembly directly and the Rust ecosystem provides tools and libraries for working with WebAssembly.

= Design

This section describes the design of the functional language, compiler, and standard library. It includes the lexical and context-free syntax of the language, the compiler's architecture, and the standard library's design.

== Language specification

The syntax of the functional language (named "Waskell")
is as already mentioned a subset of Haskell. There is a language specification document that defines the syntax and semantics of Haskell made by the Haskell team @haskell_spec. The Lexical syntax and context-free syntax of the functional language are based on this document. The lexical syntax refers to the rules that define how the characters in the source code are grouped into tokens. The context-free syntax refers to the rules that define how the tokens are grouped into expressions, declarations, and other constructs.

The syntax diagrams in this section are based on the Haskell report @haskell_spec. The conventions used in the syntax diagrams are as follows:

- Terminal symbols are shown in a monospaced font (e.g., `let`, `in`).
- Non-terminal symbols are shown in math font (e.g., $"program"$, $"lexeme"$).
- Repetition (one or more occurrences) is shown using braces (e.g., { $a$ }).
- Alternatives are shown using vertical bars (e.g., $a$ | $b$).
- Optional elements are shown using square brackets (e.g., [$a$]).
- Set subtraction is shown using brackets (e.g., $"symbol"_⟨"special" | "_" | "\"" | "'"⟩$).
- Annotations to provide additional information about the non-terminal symbols are shown in sans-serif font (e.g., $"digit" ::= sans("any digit")$).
- The name of the token used in the compiler is shown after the production rule in italics (e.g., $"integer" ::= "digit" { "digit" } italic("Integer")$).

=== Lexical syntax

The lexical syntax of Waskell is identical to Haskell. @lst_lexical_syntax shows the lexical syntax of the functional language (the text after the annotations is the token's name used in the compiler).

#figure(
  code_block(bnf(
    Prod($"program"$, Or[${ "lexeme" | "whitespace" }$][]),
    Prod($"lexeme"$, {
      Or[$"var_id" | "con_id" | "var_sym" | "con_sym"$][]
      Or[$"literal" | "special" | "reserved_id" | "reserved_op"$][]
    }),
    Prod($"whitespace"$, Or[$"whitechar"$ | $"line_comment"$ | $"block_comment"$][]),
    Prod($"var_id"$, Or[$("small" { "small" | "large" | "digit" | #`_` })_⟨"reserved_id"⟩$][_VariableIdent_]),
    Prod($"con_id"$, Or[$"large" { "small" | "large" | "digit" | #`_` }$][_ConstructorIdent_]),
    Prod($"var_sym"$, Or[$("symbol"_⟨":"⟩ { "symbol" })_⟨"reserved_op"⟩$][_VariableSym_]),
    Prod($"con_sym"$, Or[$(#`:` { "symbol" })_⟨"reserved_op"⟩$][_ConstructorSym_]),
    Prod($"literal"$, Or[$"integer" | "char" | "string"$][]),
    Prod($"special"$, Or[`(` | `)` | `,` | `;` | `[` | `]` | ``` ` ``` | `{` | `}`][_Special_]),
    Prod($"reserved_id"$, {
      Or[`case` | `class` | `data` | `default` | `deriving`][]
      Or[`do` | `else` | `foreign` | `if` | `import` | `in`][]
      Or[`infix` | `infixl` | `infixr` | `instance` | `let`][]
      Or[`module` | `newtype` | `of` | `then` | `type`][]
      Or[`where` | `_`][_ReservedId_]
    }),
    Prod($"reserved_op"$, Or[`..` | `:` | `::` | `=` | `\` | `|` | `<-` | `->` | `@` | `~` | `=>`][_ReservedOp_]),
    Prod($"whitechar"$, Or[`' '` | `\t` | `\n` | `\r` | `\f` | `\v`][]),
    Prod($"line_comment"$, {
      Or[`--`][]
      Or[$#`--` { #`any character` } #`\n`$][_LineComment_]
    }),
    Prod($"block_comment"$, { Or[$#`{-` { #`any character` } #`-}`$][_BlockComment_] },),
    Prod($"small"$, Or[$sans("any lowercase letter")$][]),
    Prod($"large"$, Or[$sans("any uppercase letter")$][]),
    Prod($"digit"$, Or[$sans("any digit")$][]),
    Prod($"symbol"$, Or[$sans("any symbol character")_⟨"special" | "_" | "\"" | "'"⟩$][]),
    Prod($"integer"$, Or[$"digit" { "digit" }$][_Integer_]),
    Prod($"char"$, Or[$#`'` "graphic"_⟨#`'`⟩ #`'`$][_Char_]),
    Prod($"string"$, Or[$#`"` { "graphic"_⟨#`"`⟩ } #`"`$][_String_]),
    Prod($"graphic"$, {
      Or[$"digit" | "small" | "large" | "symbol" | "special"$][]
      Or[`_` | `'` | `"`][]
    }),
  )),
  supplement: [Listing],
  caption: [Lexical syntax of the functional language.],
) <lst_lexical_syntax>

=== Context-free syntax

The context-free syntax of Waskell is a subset of Haskell (defined in report @haskell_spec). The context-free syntax of Waskell is based on this document. @lst_context_free_syntax shows the context-free syntax of the functional language (the text after the annotations is the non-terminal's name used in the compiler).

#figure(
  code_block(bnf(
    Prod($"body"$, Or[$"declaration" { #`;` "declaration" [ #`;` ] }$][_TopDeclarations_]),
    Prod($"declaration"$, Or[$"fun_bind" | "data_decl" | "foreign_decl"$][_TopDeclaration_]),
    Prod($"fun_bind"$, {
      Or[$"fun_lhs" #`=` "exp"$][_FunctionDeclaration_]
      Or[$"fun_sign"$][_TypeSig_]
    }),
    Prod($"data_decl"$, Or[$#`data` "simple_type" [ #`=` "constr" ]$][_DataDeclaration_]),
    Prod($"foreign_decl"$, {
      Or[$#`foreign import wasm` [ #`"lib"` ] "fun_sign"$][]
      Or[$#`foreign export wasm` [ #`"unevaluated"` ] "fun_sign"$][]
    }),
    Prod($"fun_sign"$, Or[$("var_id" | #`(` "var_sym" #`)`) #`::` "fun_type"$][]),
    Prod($"simple_type"$, Or[$"con_id" { "var_id" }$][]),
    Prod($"constr"$, Or[$"con_id" { #`|` "type" }$][]),
    Prod($"fun_type"$, Or[$"type" { #`->` "type" }$][_FunctionType_]),
    Prod($"type"$, Or[$"type_elem" { "type_elem" }$][_Type_]),
    Prod($"type_elem"$, {
      Or[$"var_id"$][_TypeVariable_]
      Or[$#`(` "fun_type" #`)`$][_ParenthesizedType_]
      Or[$#`(` "fun_type" #`,` "fun_type" { #`,` "fun_type" } #`)`$][_TupleType_]
      Or[$"type_con"$][]
    }),
    Prod($"type_con"$, {
      Or[$"con_id"$][_TypeConstructor_]
      Or[`()`][_Unit_]
      Or[$#`(,` { #`,` } #`)`$][_TupleConstructor_]
    }),
    Prod($"fun_lhs"$, Or[$("var_id" | #`(` "var_sym" #`)`) space { "apat" }$][]),
    Prod($"apat"$, {
      Or[$"var_id" [#`@` "apat"]$][_AsPattern_]
      Or[$"pat_type_con"$][]
      Or[$"integer"$][_IntegerLiteral_]
      Or[$"char"$][_CharLiteral_]
      Or[$"string"$][_StringLiteral_]
      Or[$#`_`$][_Wildcard_]
      Or[$#`(` "pat" #`)`$][_ParenthesizedPattern_]
      Or[$#`(` "pat" #`,` "pat" { #`,` "pat" } #`)`$][_TuplePattern_]
    }),
    Prod($"pat"$, {
      Or[$"con_id" "apat" { "apat" }$][_ConstructorPattern_]
      Or[$#`-` "integer"$][_NegatedIntegerLiteral_]
      Or[$"apat"$][_FunctionParameterPattern_]
    }),
    Prod($"pat_type_con"$, {
      Or[$"con_id"$][_ConstructorPattern_]
      Or[`()`][_UnitPattern_]
      Or[$#`(,` { #`,` } #`)`$][_EmptyTuplePattern_]
    }),
    Prod($"exp"$, {
      Or[$"lhs_exp" ("con_sym" | #``` ` ``` "var_id" #``` ` ```) "exp"$][_InfixedApplications_]
      Or[$#`-` "exp"$][_NegatedExpression_]
      Or[$"lhs_exp"$][_LeftHandSideExpression_]
    }),
    Prod($"lhs_exp"$, Or[$"fun_exp" { "fun_exp" }$][_FunctionApplication_]),
    Prod($"fun_exp"$, {
      Or[$"exp_type_con"$][]
      Or[$("var_id" | #`(` "var_sym" #`)`)$][_Variable_]
      Or[$"con_id"$][_Constructor_]
      Or[$"integer"$][_IntegerLiteral_]
      Or[$"char"$][_CharLiteral_]
      Or[$"string"$][_StringLiteral_]
      Or[$#`(` "exp" #`)`$][_ParenthesizedExpr_]
      Or[$#`(` "exp" #`,` "exp" { #`,` "exp" } #`)`$][_TupleExpr_]
    }),
    Prod($"exp_type_con"$, {
      Or[$"con_id"$][_Constructor_]
      Or[`()`][_Unit_]
      Or[$#`(,` { #`,` } #`)`$][_Empty_]
    }),
  )),
  supplement: [Listing],
  caption: [Context-free syntax of the functional language.],
) <lst_context_free_syntax>

// don't to mention constructor symbols are not supported

As we can see the context-free syntax is a subset of Haskell. The language features that are supported are the following:

-

=== Language features

//Skipped features (compare to spec):

//- irrefutable patterns + pattern bindings
//- typed expressions
//- holes
//- operator stuff ?? (precedence, associativity, fixity, arity > 2 operators / paren func def thing)
  //- "(a &\* b) c = ..."
//- Floats
//- string escaping
//- No sections (e.g. (1 +) or (+ 1))
//- labeled fields in records
//- operator precedence
//- definition of operator type constructors (check for usage of operators in general)

In short the subset of Haskell that is used in Waskell is the following:
- Function declarations with simple pattern matching
- Function application and currying
- Forced type annotations (no type inference)
- Simple types (Int, Bool, Char, String, List, Tuple)
- Simple custom generic types (no type classes)
- Simple type polymorphism (no type classes)
- Defining operators (no precedence, associativity, fixity)

#todo("make chapter about each feature with examples and exceptions")

=== Standard library design

The standard library of the functional language is a subset of the Haskell standard library (or the Prelude). The standard library provides a set of functions and types that are commonly used in functional programming. The standard library includes functions for working with lists, tuples, numbers, and other data types. The design of the standard library is based on the Haskell standard library documentation @haskell_prelude.

#heading("Basic types", level: 4, numbering: none, outlined: false)

@lst_basic_types shows the list of basic types in the standard library.

#figure(
  code_block[```haskell
  -- Boolean type with values True and False.
  data Bool = True | False
  -- Character type representing Unicode characters.
  data Char = ...
  -- Integer type with fixed precision.
  data Int = ...
  -- String type representing lists of characters (alias for [Char]).
  type String = [Char]
  -- List of elements of type a (two constructors: [] and :).
  data List a = Nil | Cons a (List a)
  -- Tuple type with n elements of types a, b, ..., z.
  data (a, b, ..., z) = ...
  -- Unit type with a single value denoted by ().
  data () = ...
  -- Maybe type representing optional values.
  data Maybe a = Just a | Nothing
  -- Either type representing disjoint unions.
  data Either a b = Left a | Right b
  -- Ratio type representing fractions.
  data Ratio = Ratio Int Int
  ```],
  caption: [The list of basic types in the standard library.],
) <lst_basic_types>

#heading("Boolean functions", level: 4, numbering: none, outlined: false)

@lst_boolean_functions shows the list of functions for working with booleans in the standard library.

#figure(
  code_block[```haskell
  boolToString :: Bool -> String -- Converts a boolean to a string.
  boolEq :: Bool -> Bool -> Bool -- Equality comparison for booleans.
  not :: Bool -> Bool -- Negates a boolean value.
  (&&), (||) :: Bool -> Bool -> Bool -- Logical AND and OR operations.
  if' :: Bool -> a -> a -> a -- Conditional expression.
  ```],
  caption: [The list of functions for working with booleans.],
) <lst_boolean_functions>

#heading("Numeric functions", level: 4, numbering: none, outlined: false)

@lst_numeric_functions shows the list of functions for working with numbers in the standard library.

#figure(
  code_block[```haskell
  intToString :: Int -> String -- Converts an integer to a string.
  data Ordering = LT | EQ | GT -- Ordering type for comparison results.
  compare :: Int -> Int -> Ordering -- Compares two values.
  (+), (-), (*) :: Int -> Int -> Int -- Addition, subtraction, and multiplication.
  negate, abs :: Int -> Int -- Sign negation and absolute value.
  (==), (/=), (<), (<=), (>), (>=) :: Int -> Int -> Bool -- Comparison operations.
  min, max :: Int -> Int -> Int -- Minimum and maximum of two values.
  minBound, maxBound :: Int -- Smallest and largest value of a type.
  quot, rem :: Int -> Int -> Int -- Quotient and remainder operations.
  quotRem :: Int -> Int -> (Int, Int) -- Quotient and remainder as a pair.
  even, odd :: Int -> Bool -- Checks for even and odd numbers.
  (^) :: Int -> Int -> Int -- Exponentiation operation.
  ```],
  caption: [The list of functions for working with numbers.],
) <lst_numeric_functions>

#heading("List functions", level: 4, numbering: none, outlined: false)

@lst_list_functions1 and @lst_list_functions2 shows the list of functions for working with lists in the standard library.

#figure(
  code_block[```haskell
  listToString :: (a -> String) -> List a -> String -- Converts a list to a string.
  listEq :: (a -> a -> Bool) -> List a -> List a -> Bool -- Equality comparison for lists.
  map :: (a -> b) -> List a -> List b -- Applies a function to each element of a list.
  (++), concat :: List a -> List a -> List a -- Concatenates two lists.
  filter :: (a -> Bool) -> List a -> List a -- Filters a list based on a predicate.
  head :: List a -> Maybe a -- Returns the first element of a list.
  last :: List a -> Maybe a -- Returns the last element of a list.
  tail :: List a -> Maybe (List a) -- Returns the list without the first element.
  init :: List a -> Maybe (List a) -- Returns the list without the last element.
  null :: List a -> Bool -- Checks if a list is empty.
  length :: List a -> Int -- Returns the length of a list.
  (!!): List a -> Int -> Maybe a -- Returns the element at a specific index.
  reverse :: List a -> List a -- Reverses a list.

  -- Reduction functions
  foldl :: (b -> a -> b) -> b -> List a -> b -- Folds a list from the left.
  foldr :: (a -> b -> b) -> b -> List a -> b -- Folds a list from the right.
  and :: List Bool -> Bool -- Checks if all elements are true.
  or :: List Bool -> Bool -- Checks if any element is true.
  any :: (a -> Bool) -> List a -> Bool -- Checks if any element satisfies a predicate.
  all :: (a -> Bool) -> List a -> Bool -- Checks if all elements satisfy a predicate.
  sum :: List Int -> Int -- Sums the elements of a list.
  product :: List Int -> Int -- Multiplies the elements of a list.
  concat :: List (List a) -> List a -- Flattens a list of lists.
  concatMap :: (a -> List b) -> List a -> List b -- Maps and concatenates a list.
  maximum :: List a -> a -- Returns the maximum element of a list.
  minimum :: List a -> a -- Returns the minimum element of a list.

  -- Building functions
  scanr :: (a -> b -> b) -> b -> List a -> List b -- Scans a list from the right.
  scanl :: (b -> a -> b) -> b -> List a -> List b -- Scans a list from the left.
  iterate :: (a -> a) -> a -> List a -- Generates an infinite list by repeatedly applying a function.
  repeat :: a -> List a -- Generates an infinite list with a single element.
  replicate :: Int -> a -> List a -- Generates a list with a repeated element.
  cycle :: List a -> List a -- Generates an infinite list by cycling a list.
  ```],
  caption: [The list of functions for working with lists part 1.],
) <lst_list_functions1>

#figure(
  code_block[```haskell
  -- Sublist functions
  take :: Int -> List a -> List a -- Takes the first n elements of a list.
  drop :: Int -> List a -> List a -- Drops the first n elements of a list.
  splitAt :: Int -> List a -> (List a, List a) -- Splits a list at a specific index.
  takeWhile :: (a -> Bool) -> List a -> List a -- Takes elements from a list while a predicate is true.
  dropWhile :: (a -> Bool) -> List a -> List a -- Drops elements from a list while a predicate is true.
  span :: (a -> Bool) -> List a -> (List a, List a) -- Splits a list into two parts based on a predicate.
  break :: (a -> Bool) -> List a -> (List a, List a) -- Splits a list into two parts based on a predicate.

  -- Zipping functions
  zip :: List a -> List b -> List (a, b) -- Zips two lists together.
  zipWith :: (a -> b -> c) -> List a -> List b -> List c -- Zips two lists with a function.
  unzip :: List (a, b) -> (List a, List b) -- Unzips a list of pairs.
  ```],
  caption: [The list of functions for working with lists part 2.],
) <lst_list_functions2>

#heading("Tuple functions", level: 4, numbering: none, outlined: false)

@lst_tuple_functions shows the list of functions for working with tuples in the standard library.

#figure(
  code_block[```haskell
  fst :: (a, b) -> a -- Returns the first element of a tuple.
  snd :: (a, b) -> b -- Returns the second element of a tuple.
  curry :: ((a, b) -> c) -> a -> b -> c -- Curries a function.
  uncurry :: (a -> b -> c) -> (a, b) -> c -- Uncurries a function.
  ```],
  caption: [The list of functions for working with tuples.],
) <lst_tuple_functions>

#heading("Ratio functions", level: 4, numbering: none, outlined: false)

@lst_ratio_functions shows the list of functions for working with ratios in the standard library.

#figure(
  code_block[```haskell
  ratioToString :: Ratio -> String -- Converts a ratio to a string.
  ratioEq :: Ratio -> Ratio -> Bool -- Equality comparison for ratios.
  (%) :: Int -> Int -> Ratio -- Constructs a ratio from two integers.
  numerator, denominator :: Ratio -> Int -- Extracts the numerator and denominator of a ratio.
  ratioFromInt :: Int -> Ratio -- Converts an integer to a ratio.
  addRatio, subRatio, mulRatio, divRatio :: Ratio -> Ratio -> Ratio -- Arithmetic operations on ratios.
  recipRatio, negateRatio :: Ratio -> Ratio -- Reciprocal and negation of a ratio.
  evalToInt :: Ratio -> Int -- Evaluates a ratio
  ```],
  caption: [The list of functions for working with ratios.],
) <lst_ratio_functions>

#heading("Miscellaneous functions", level: 4, numbering: none, outlined: false)

@lst_misc_functions shows the list of miscellaneous functions in the standard library.

#figure(
  code_block[```haskell
  maybe :: b -> (a -> b) -> Maybe a -> b -- Handles optional values.
  either :: (a -> c) -> (b -> c) -> Either a b -> c -- Handles disjoint unions.

  id :: a -> a -- Identity function.
  const :: a -> b -> a -- Constant function.
  flip :: (a -> b -> c) -> b -> a -> c -- Flips the arguments of a function.
  ($) :: (a -> b) -> a -> b -- Function application operator.
  (.) :: (b -> c) -> (a -> b) -> a -> c -- Function composition operator.
  until :: (a -> Bool) -> (a -> a) -> a -> a -- Repeatedly applies a function until a predicate is true.
  error :: String -> a -- Throws an error with a message.
  undefined :: a -- Throws an undefined error.
  ```],
  caption: [The list of miscellaneous functions.],
) <lst_misc_functions>

== Compiler architecture

#todo("add diagram and explain the different stages of the compiler")

= Implementation

// Challenges
// - Implementing layout in the lexer difficult since I use a library that does not support it
// - apply function generation because the type of the function being called indirectly is not known
// - wasm_encode crate relies on order of functions in the module to be correct and that is a challenge to maintain
// - merge the wasm-lib
// - the apply function again but this time more generic (not only integer arguments) / unit type issues in general -> if import always remove return on unit, if export only remove for wrapper, else never remove
// - The representing of PAPs at the top level for code generation
// - Implementation of the parametric polymorphism and specifically assigning a function type to a type variable
// - RCs and having mutliple mutalble references to the symbol while doing recursion -> consume symbol table clone the symbol and reinsert the modified symbol
// - Exports and type variables and recursive types (temporary fix -> "unevaluated" tag on export) would need to remove difference between literal and complex datastructure and make make_val recursive
// - Over applied functions don't work in the type checker because the function type is internally uncurried
// - Issue with scanr and pattern matching
// - Borrowing on symbol table and type checking

= Evaluation

= Conclusion

== Challenges

== Future work

== Personal opinion
