// SPDX-License-Identifier: MIT

//! This module contains the code generation logic for the compiler.

mod encoder_wrapper;
mod wasm_generation;

pub use wasm_generation::generate_code;
