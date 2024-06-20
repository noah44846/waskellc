// SPDX-License-Identifier: MIT

//! This module is responsible for generating the Wasm code from the AST of the Waskell programming language.

mod encoder_wrapper;
mod wasm_generation;

pub use wasm_generation::generate_code;
