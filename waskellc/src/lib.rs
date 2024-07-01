// SPDX-License-Identifier: MIT

//! The waskellc crate is a compiler for the Waskell language.

pub mod ast_gen;
pub mod code_gen;
pub mod validator;

pub fn compile(
    file_contents: &str,
    debug_lexer: bool,
    debug_ast: bool,
    debug_symbols: bool,
    debug_desugar: bool,
    debug_wasm: bool,
    show_wasm_offsets: bool,
) -> Result<Vec<u8>, String> {
    let ast = ast_gen::parse(file_contents, debug_lexer, debug_ast)
        .map_err(|e| format!("Error while parsing: {}", e))?;
    let symbol_table = validator::validate(ast, debug_symbols, debug_desugar)
        .map_err(|e| format!("Error while validating: {}", e))?;
    code_gen::generate_code(symbol_table, debug_wasm, show_wasm_offsets)
        .map_err(|e| format!("Error while generating code: {}", e))
}
