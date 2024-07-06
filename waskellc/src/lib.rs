// SPDX-License-Identifier: MIT

//! The waskellc crate is a compiler for the Waskell language.

pub mod ast_gen;
pub mod code_gen;
pub mod validator;

#[derive(Default)]
pub struct DebugOptions {
    pub debug_lexer: bool,
    pub debug_ast: bool,
    pub debug_symbols: bool,
    pub debug_desugar: bool,
    pub debug_wasm: bool,
    pub show_wasm_offsets: bool,
}

pub fn compile(
    file_contents: &str,
    prelude_contents: &str,
    DebugOptions {
        debug_lexer,
        debug_ast,
        debug_symbols,
        debug_desugar,
        debug_wasm,
        show_wasm_offsets,
    }: DebugOptions,
) -> Result<Vec<u8>, String> {
    let full_contents = format!("{}\n{}", prelude_contents, file_contents);
    let ast = ast_gen::parse(&full_contents, debug_lexer, debug_ast)
        .map_err(|e| format!("Error while parsing: {}", e))?;
    let symbol_table = validator::validate(ast, debug_symbols, debug_desugar)
        .map_err(|e| format!("Error while validating: {}", e))?;
    code_gen::generate_code(symbol_table, debug_wasm, show_wasm_offsets)
        .map_err(|e| format!("Error while generating code: {}", e))
}
