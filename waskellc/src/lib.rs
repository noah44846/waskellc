// SPDX-License-Identifier: MIT

//! The waskellc crate is a compiler for the Waskell language.

pub mod ast_gen;
pub mod code_gen;
pub mod validator;

pub fn compile(file_contents: &str) -> Result<Vec<u8>, String> {
    let ast = ast_gen::parse(file_contents)?;
    println!("AST:\n{:#?}", ast);
    let symbol_table = validator::validate(ast)?;
    println!("Symbol Table:\n{:#?}", symbol_table);
    code_gen::generate_code(symbol_table)
}
