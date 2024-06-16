//! The waskellc crate is a compiler for the Waskell language.

use wasm_encoder::Module;

pub mod code_gen;
pub mod parser;
pub mod validator;

pub fn compile(file_contents: &str) -> Result<Module, String> {
    let ast = parser::parse(file_contents)?;
    println!("AST:\n{:#?}", ast);
    let symbol_table = validator::validate(ast)?;
    println!("Symbol Table:\n{:#?}", symbol_table);
    code_gen::generate(symbol_table)
}
