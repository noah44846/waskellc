// SPDX-License-Identifier: MIT

//! This module contains the parser and lexer for the Waskell programming language.

mod lexer;
mod parser;

pub use parser::{
    parse, DataConstructor, DataDeclaration, Expression, FunctionDeclaration,
    FunctionParameterExpression, FunctionParameterPattern, FunctionType, LeftHandSideExpression,
    TopDeclaration, TopDeclarations, Type, TypeApplicationElement,
};
