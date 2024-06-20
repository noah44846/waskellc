// SPDX-License-Identifier: MIT

//! This module for doing type checking and other validations on the AST of the Waskell programming language.

mod symbol_check;
mod type_check;

pub use symbol_check::{validate, Expression, Symbol, SymbolTable, Type};
