// SPDX-License-Identifier: MIT

//! The waskellc crate is a compiler for the Waskell language.

#![warn(missing_docs)]

pub mod ast_gen;
pub mod code_gen;
pub mod validator;

/// Debug options for the compiler.
#[derive(Default)]
pub struct DebugOptions {
    /// Whether to print the lexer output.
    pub debug_lexer: bool,
    /// Whether to print the AST.
    pub debug_ast: bool,
    /// Whether to print the symbol table.
    pub debug_symbols: bool,
    /// Whether to print the desugared symbol table.
    pub debug_desugar: bool,
    /// Whether to print the WAT representation of the compiled WASM.
    pub debug_wasm: bool,
    /// Whether to show the offsets of the WASM instructions.
    pub show_wasm_offsets: bool,
}

/// Compiles the given Waskell code.
///
/// The prelude contents are prepended to the file contents and the resulting code is compiled.
/// The debug options are used to determine what to print during the compilation process.
///
/// Returns the compiled WASM code as a vector of bytes.
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
