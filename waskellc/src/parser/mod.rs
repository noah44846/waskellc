// SPDX-License-Identifier: MIT

//! This module contains the parser and lexer for the Waskell programming language.

mod ast_gen;
mod lexer;

pub use ast_gen::{
    parse, Expression, FunctionDeclaration, FunctionParameterExpression, FunctionParameterPattern,
    FunctionType, LeftHandSideExpression, TopDeclaration, TopDeclarations, Type,
    TypeApplicationElement,
};
