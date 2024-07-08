// SPDX-License-Identifier: MIT

use std::rc::Rc;

use wasm_encoder::*;

use crate::validator;

use crate::code_gen::encoder_wrapper::{
    DeclaredWasmFunctionTypes, DeclaredWasmFunctions, DeclaredWasmImports, WasmFunctionLocals,
};

/// A struct that is used to generate the WebAssembly code from the validated AST.
struct CodeGen {
    /// The code section of the WebAssembly module.
    code_section: CodeSection,
    /// The function types declared in the WebAssembly module.
    function_types: DeclaredWasmFunctionTypes,
    /// The imports declared in the WebAssembly module.
    imports: Option<DeclaredWasmImports>,
    /// The functions declared in the WebAssembly module.
    functions: Option<DeclaredWasmFunctions>,
    /// The symbol table.
    symbol_table: Rc<validator::SymbolTable>,
}

impl CodeGen {
    /// Generates the WebAssembly code from the validated AST. The generated code is then validated
    /// using the `wasmparser` crate.
    ///
    /// If `print_wasm` is true the generated WebAssembly code is printed to the terminal. If
    /// `show_offset` is true the offsets of the instructions are printed to the terminal.
    fn generate(
        symbol_table: validator::SymbolTable,
        print_wasm: bool,
        show_offset: bool,
    ) -> Result<Vec<u8>, String> {
        let symbol_table = Rc::new(symbol_table);

        let mut res = CodeGen {
            code_section: CodeSection::new(),
            function_types: DeclaredWasmFunctionTypes::new(),
            imports: Some(DeclaredWasmImports::new()),
            functions: None,
            symbol_table,
        };

        res.handle_imports()?;

        let module = res.generate_functions()?;
        let wasm_bytes = module.finish();

        if print_wasm {
            let mut config = wasmprinter::Config::new();
            config.print_offsets(show_offset);
            config.name_unnamed(true);

            let mut printer = wasmprinter::PrintTermcolor(termcolor::StandardStream::stdout(
                termcolor::ColorChoice::Always,
            ));

            config
                .print(&wasm_bytes, &mut printer)
                .map_err(|e| e.to_string())?;
        }

        wasmparser::validate(&wasm_bytes).map_err(|e| e.to_string())?;
        Ok(wasm_bytes)
    }

    /// Handles the imports of foreign functions and the helper functions that are imported from
    /// the lib module.
    ///
    /// It generates the function types for the foreign functions and the helper functions. The
    /// foreign functions also get a wrapper so that it can easily be used by other functions.
    /// Finally converts the [`DeclaredWasmImports`] into [`DeclaredWasmFunctions`].
    fn handle_imports(&mut self) -> Result<(), String> {
        let imports = self.imports.as_mut().unwrap();

        let arg_1_int32_ret_int32 = self
            .function_types
            .function_type_idx(vec![ValType::I32], Some(ValType::I32))
            .unwrap();
        let arg_2_int32_ret_int32 = self
            .function_types
            .function_type_idx(vec![ValType::I32; 2], Some(ValType::I32))
            .unwrap();
        let arg_4_int32_ret_int32 = self
            .function_types
            .function_type_idx(vec![ValType::I32; 4], Some(ValType::I32))
            .unwrap();

        // TODO: memory size ??
        imports.import_memory(
            "lib",
            "memory",
            MemoryType {
                minimum: 1,
                maximum: None,
                memory64: false,
                shared: false,
                page_size_log2: None,
            },
        );

        // TODO: fix naming collisions with the imported functions
        imports
            .import_func("lib", ":full_eval", arg_1_int32_ret_int32)
            .unwrap();
        imports
            .import_func("lib", ":eval", arg_1_int32_ret_int32)
            .unwrap();
        imports
            .import_func("lib", ":make_env", arg_1_int32_ret_int32)
            .unwrap();
        imports
            .import_func("lib", ":make_thunk", arg_2_int32_ret_int32)
            .unwrap();
        imports
            .import_func("lib", ":make_pap", arg_4_int32_ret_int32)
            .unwrap();
        imports
            .import_func("lib", ":add_to_pap", arg_2_int32_ret_int32)
            .unwrap();
        imports
            .import_func("lib", ":make_thunk_from_pap", arg_2_int32_ret_int32)
            .unwrap();
        imports
            .import_func("lib", ":make_val", arg_2_int32_ret_int32)
            .unwrap();

        self.symbol_table
            .clone()
            .values()
            .map(|s| s.as_ref().borrow())
            .filter(|s| s.is_imported())
            .map(|s| {
                let remove_return_when_unit = !matches!(s.import_module_name(), Some("lib"));
                let ty_idx = self.func_ty_idx_from_symbol(&s, remove_return_when_unit)?;
                let module_name = s.import_module_name().unwrap();
                self.imports
                    .as_mut()
                    .unwrap()
                    .import_func(module_name, &s.name, ty_idx)
            })
            .collect::<Result<Vec<_>, String>>()?;

        let imports = self.imports.take().unwrap();
        self.functions = Some(imports.into());

        self.symbol_table
            .clone()
            .values()
            .map(|s| s.as_ref().borrow())
            .filter(|s| s.import_module_name() == Some("foreign"))
            .map(|s| self.generate_foreign_import_wrapper(&s))
            .collect::<Result<Vec<_>, String>>()?;

        Ok(())
    }

    /// Generates the functions from the symbol table.
    ///
    /// First it generates the code for the data constructors. Then it generates the function
    /// signatures for all the functions in the symbol table. Then it generates the function bodies
    /// for all the functions in the symbol table. Finally it generates the apply function and
    /// returns the WebAssembly module.
    fn generate_functions(mut self) -> Result<Module, String> {
        let symbol_table = self.symbol_table.clone();
        let symbols = symbol_table
            .values()
            .map(|s| s.as_ref().borrow())
            .filter(|s| !s.is_imported());

        symbols
            .clone()
            .filter(|s| s.data_constructor_idx.is_some())
            .map(|s| self.generate_data_constructors(&s))
            .collect::<Result<Vec<_>, String>>()?;

        let functions = symbols.clone().filter(|s| s.data_constructor_idx.is_none());

        // create the function signatures
        functions
            .clone()
            .map(|s| self.create_signature(&s))
            .collect::<Result<Vec<_>, String>>()?;

        functions
            .clone()
            .map(|s| self.generate_function_body(&s))
            .collect::<Result<Vec<_>, String>>()?;

        let apply_func_idx = self.generate_apply_function()?;

        let type_section = self.function_types.type_section();
        let (import_section, function_section, export_section, element_section) =
            self.functions.unwrap().finish(apply_func_idx);

        let mut module = Module::new();
        module
            .section(&type_section)
            .section(&import_section)
            .section(&function_section)
            .section(&export_section)
            .section(&element_section)
            .section(&self.code_section);

        Ok(module)
    }

    /// Creates or gets the function type index for a given symbol.
    ///
    /// The `remove_return_when_unit` parameter is used to remove the return type when the function
    /// returns a unit type. This is used for the exported functions but for waskell functions the
    /// return type is always an integer since we need to return the thunk that will be evaluated
    /// at a later time.
    fn func_ty_idx_from_symbol(
        &mut self,
        symbol: &validator::Symbol,
        remove_return_when_unit: bool,
    ) -> Result<u32, String> {
        let remove_return_when_unit = if remove_return_when_unit {
            None
        } else {
            Some(ValType::I32)
        };

        let (params, return_ty) = match &symbol.ty {
            validator::Type::Function(func_params) => {
                // put the last element of the params as the result and the rest as the params
                if func_params.is_empty() {
                    return Err("Function must have at least one parameter".to_string());
                }

                let params = vec![ValType::I32; func_params.len() - 1];

                let return_ty = if let validator::Type::Unit = func_params.last().unwrap() {
                    remove_return_when_unit
                } else {
                    Some(ValType::I32)
                };
                (params, return_ty)
            }
            validator::Type::Unit => (vec![], remove_return_when_unit),
            _ => (vec![], Some(ValType::I32)),
        };

        Ok(self
            .function_types
            .function_type_idx(params, return_ty)
            .unwrap())
    }

    /// Generates the function type index for a given symbol and exports it if applicable.
    ///
    /// If the symbol is a foreign export a separate function, prefixed with `:export_` is created
    /// (possibly with a different return type) and exported.
    fn create_signature(&mut self, symbol: &validator::Symbol) -> Result<(), String> {
        let func_type = self.func_ty_idx_from_symbol(symbol, false)?;

        self.functions
            .as_mut()
            .unwrap()
            .add_function(&symbol.name, func_type)
            .ok_or(format!(
                "Function {} already exists in the function table",
                symbol.name
            ))?;

        if symbol.is_exported() {
            let exported_func_name = if symbol.is_unevaluated_export() {
                symbol.name.clone()
            } else {
                let name = format!(":exported_{}", symbol.name);
                let func_type = self.func_ty_idx_from_symbol(symbol, true)?;
                self.functions
                    .as_mut()
                    .unwrap()
                    .add_function(&name, func_type);
                name
            };
            self.functions
                .as_mut()
                .unwrap()
                .export(&exported_func_name, &symbol.name);
        }

        Ok(())
    }

    /// Generates a data constructor from a symbol.
    ///
    /// Return an error if the function already exists in the function table.
    fn generate_data_constructors(&mut self, symbol: &validator::Symbol) -> Result<(), String> {
        let mut instrs = vec![];
        let functions = self.functions.as_mut().unwrap();
        let make_val_idx = functions
            .function_index(":make_val")
            .ok_or("Function make_val not found in the function table")?;
        let make_env_idx = functions
            .function_index(":make_env")
            .ok_or("Function make_env not found in the function table")?;

        let ty_idx = self.func_ty_idx_from_symbol(symbol, true)?;

        self.functions
            .as_mut()
            .unwrap()
            .add_function(&symbol.name, ty_idx)
            .ok_or(format!(
                "Function {} already exists in the function table",
                symbol.name
            ))?;

        let data_constructor_index = symbol.data_constructor_idx.unwrap();

        let local_idx = symbol.arity() as u32; // local variable to store the env pointer

        instrs.push(Instruction::I32Const(symbol.arity() as i32 + 1)); // + 1 for the data constructor index
        instrs.push(Instruction::Call(make_env_idx));
        instrs.push(Instruction::LocalSet(local_idx));

        instrs.push(Instruction::LocalGet(local_idx));
        instrs.push(Instruction::I32Const(symbol.arity() as i32)); // number of params (not including the data constructor index)
        instrs.push(Instruction::I32Store(MemArg {
            align: 2,
            offset: 0,
            memory_index: 0,
        }));

        instrs.push(Instruction::LocalGet(local_idx));
        instrs.push(Instruction::I32Const(data_constructor_index as i32)); // data constructor index
        instrs.push(Instruction::I32Store(MemArg {
            align: 2,
            offset: 4,
            memory_index: 0,
        }));

        for i in 0..symbol.arity() {
            instrs.push(Instruction::LocalGet(local_idx));
            instrs.push(Instruction::LocalGet(i as u32));
            instrs.push(Instruction::I32Store(MemArg {
                align: 2,
                offset: ((i + 2) * 4) as u64,
                memory_index: 0,
            }));
        }

        instrs.push(Instruction::I32Const(1));
        instrs.push(Instruction::LocalGet(local_idx));
        instrs.push(Instruction::Call(make_val_idx));
        instrs.push(Instruction::End);

        let mut f = Function::new(vec![(1, ValType::I32)]);
        instrs.iter().for_each(|instr| {
            f.instruction(instr);
        });

        self.code_section.function(&f);

        Ok(())
    }

    /// Generates the code for a function.
    fn generate_function_body(&mut self, symbol: &validator::Symbol) -> Result<(), String> {
        let mut locals = WasmFunctionLocals::new(symbol.arity() as u32);
        let mut instrs = vec![];

        let expr = symbol.expr.as_ref().ok_or(format!(
            "Function {} does not have an expression",
            symbol.name
        ))?;

        self.generate_instructions_from_top_level_expr(expr, &mut locals, &mut instrs)?;

        fn add_function_to_code_section(
            code_section: &mut CodeSection,
            locals: &WasmFunctionLocals,
            instrs: &[Instruction],
        ) {
            let mut f: Function = locals.clone().into();
            instrs.iter().for_each(|instr| {
                f.instruction(instr);
            });

            code_section.function(&f);
        }

        add_function_to_code_section(&mut self.code_section, &locals, &instrs);

        if symbol.is_exported() && !symbol.is_unevaluated_export() {
            let mut instrs = vec![];
            self.generate_instructions_from_exported(symbol, &mut instrs)?;
            add_function_to_code_section(
                &mut self.code_section,
                &WasmFunctionLocals::default(),
                &instrs,
            );
        }

        Ok(())
    }

    /// Generates a wrapper function for a foreign export.
    ///
    /// The wrapper function will call the foreign export and then call the `:full_eval` function
    /// to evaluate the result. The result is then wrapped in a thunk and returned if the return
    /// type is not a unit.
    fn generate_instructions_from_exported(
        &mut self,
        sym: &validator::Symbol,
        instrs: &mut Vec<Instruction>,
    ) -> Result<(), String> {
        let exported_func_name = format!(":exported_{}", &sym.name);
        self.functions
            .as_mut()
            .unwrap()
            .function_index(&exported_func_name)
            .ok_or(format!(
                "Exported function definition {} not found",
                exported_func_name
            ))?;

        let functions = self.functions.as_mut().unwrap();
        let func_idx = functions
            .function_index(&sym.name)
            .ok_or(format!("Function {} not found", sym.name))?;
        let full_eval_idx = functions
            .function_index(":full_eval")
            .ok_or("Function full_eval not found in the function table")?;
        let make_val_idx = functions
            .function_index(":make_val")
            .ok_or("Function make_val not found in the function table")?;

        match &sym.ty {
            validator::Type::Function(params) => {
                for (i, param) in params.iter().take(params.len() - 1).enumerate() {
                    instrs.push(Instruction::I32Const(
                        if matches!(param, validator::Type::TypeVar { .. }) {
                            println!("{}", sym.name);
                            todo!("TypeVar not implemented as a parameter for exported functions")
                        } else if matches!(param, validator::Type::Int) {
                            0
                        } else {
                            1
                        },
                    ));
                    instrs.push(Instruction::LocalGet(i as u32));
                    instrs.push(Instruction::Call(make_val_idx));
                }
                instrs.push(Instruction::Call(func_idx));
                instrs.push(Instruction::Call(full_eval_idx));

                if let validator::Type::Unit = params.last().unwrap() {
                    instrs.push(Instruction::Drop);
                }

                instrs.push(Instruction::End);
            }
            validator::Type::List(_) | validator::Type::Tuple(_) => todo!(),
            ty => {
                instrs.push(Instruction::Call(func_idx));
                instrs.push(Instruction::Call(full_eval_idx));

                if let validator::Type::Unit = ty {
                    instrs.push(Instruction::Drop);
                }

                instrs.push(Instruction::End);
            }
        };
        Ok(())
    }

    /// Generates a wrapper function for a foreign import.
    ///
    /// The wrapper function will call wrap all the parameters using the `:make_val` function and
    /// then call the foreign import. The result is then wrapped and returned if the
    /// return type is not a unit.
    fn generate_foreign_import_wrapper(&mut self, sym: &validator::Symbol) -> Result<(), String> {
        let mut instrs = vec![];
        let func_name = format!(":imported_{}", &sym.name);

        let wrapper_ty_idx = self.func_ty_idx_from_symbol(sym, true)?;

        let functions = self.functions.as_mut().unwrap();
        // declare the wrapper function
        functions
            .add_function(&func_name, wrapper_ty_idx)
            .ok_or(format!("Function {} already exists", func_name))?;

        let func_idx = functions
            .function_index(&sym.name)
            .ok_or(format!("Function {} not found", sym.name))?;
        let make_val_idx = functions
            .function_index(":make_val")
            .ok_or("Function make_val not found in the function table")?;
        let full_eval_idx = functions
            .function_index(":full_eval")
            .ok_or("Function full_eval not found in the function table")?;

        for i in 0..sym.arity() {
            instrs.push(Instruction::LocalGet(i as u32));
            instrs.push(Instruction::Call(full_eval_idx));
        }

        instrs.push(Instruction::Call(func_idx));

        if let validator::Type::Function(params) = &sym.ty {
            if let validator::Type::Unit = params.last().unwrap() {
            } else {
                // TODO: change to one if it isn't a int
                instrs.push(Instruction::LocalSet(0));
                instrs.push(Instruction::I32Const(0));
                instrs.push(Instruction::LocalGet(0));
                instrs.push(Instruction::Call(make_val_idx));
            }
        } else {
            return Err(
                "Foreign import must be a function (should have been catched by sym_checker)"
                    .to_string(),
            );
        }

        instrs.push(Instruction::End);

        let mut f = Function::new(vec![]);
        instrs.iter().for_each(|instr| {
            f.instruction(instr);
        });

        self.code_section.function(&f);

        Ok(())
    }

    /// Generates the code for a top level expression.
    ///
    /// If the top level expression is a lambda abstraction the parameters are added to a scope and
    /// passed to the [`generate_instructions_for_expr`] function.
    fn generate_instructions_from_top_level_expr(
        &mut self,
        expr: &validator::Expression,
        locals: &mut WasmFunctionLocals,
        instrs: &mut Vec<Instruction>,
    ) -> Result<(), String> {
        match expr {
            validator::Expression::LambdaAbstraction(syms, body) => {
                let typed_params = syms
                    .iter()
                    .enumerate()
                    .map(|(i, s)| (i as u32, s.as_str()))
                    .collect::<Vec<_>>();
                let local_idx =
                    self.generate_instructions_for_expr(&typed_params, body, locals, instrs)?;

                instrs.push(Instruction::LocalGet(local_idx));
                instrs.push(Instruction::End);
            }
            validator::Expression::FunctionApplication { .. } => {
                let local_idx = self.generate_instructions_for_expr(&[], expr, locals, instrs)?;
                instrs.push(Instruction::LocalGet(local_idx));
                instrs.push(Instruction::End);
            }
            validator::Expression::Symbol(sym) => {
                let sym_ref = sym.as_ref().borrow();

                for i in 0..sym_ref.arity() {
                    instrs.push(Instruction::LocalGet(i as u32));
                }

                let func_idx = self
                    .functions
                    .as_mut()
                    .unwrap()
                    .function_index(&sym_ref.name)
                    .ok_or(format!(
                        "Function {} not found in the function table",
                        sym_ref.name
                    ))?;

                instrs.push(Instruction::Call(func_idx));
                instrs.push(Instruction::End);
            }
            validator::Expression::IntLiteral(val) => {
                let make_val_idx = self
                    .functions
                    .as_mut()
                    .unwrap()
                    .function_index(":make_val")
                    .ok_or("Function make_val not found in the function table")?;

                instrs.push(Instruction::I32Const(0));
                instrs.push(Instruction::I32Const(*val));
                instrs.push(Instruction::Call(make_val_idx));
                instrs.push(Instruction::End);
            }
            validator::Expression::CharLiteral(val) => {
                let make_val_idx = self
                    .functions
                    .as_mut()
                    .unwrap()
                    .function_index(":make_val")
                    .ok_or("Function make_val not found in the function table")?;

                instrs.push(Instruction::I32Const(0));
                instrs.push(Instruction::I32Const(*val as i32));
                instrs.push(Instruction::Call(make_val_idx));
                instrs.push(Instruction::End);
            }
            validator::Expression::StringLiteral(val) => {
                let functions = self.functions.as_mut().unwrap();
                let cons_idx = functions
                    .function_index("Cons")
                    .ok_or("Function Cons not found in the function table")?;

                let nil_idx = functions
                    .function_index("Nil")
                    .ok_or("Function Nil not found in the function table")?;

                let make_val_idx = functions
                    .function_index(":make_val")
                    .ok_or("Function make_val not found in the function table")?;

                let local_idx = locals.add_local(ValType::I32);

                instrs.push(Instruction::Call(nil_idx));
                instrs.push(Instruction::LocalSet(local_idx));

                for c in val.chars().rev() {
                    instrs.push(Instruction::I32Const(0));
                    instrs.push(Instruction::I32Const(c as i32));
                    instrs.push(Instruction::Call(make_val_idx));
                    instrs.push(Instruction::LocalGet(local_idx));
                    instrs.push(Instruction::Call(cons_idx));
                    instrs.push(Instruction::LocalSet(local_idx));
                }

                instrs.push(Instruction::LocalGet(local_idx));
                instrs.push(Instruction::End);
            }
            _ => todo!("Expression not supported or not implemented"),
        }
        Ok(())
    }

    /// Generates the code for an expression.
    ///
    /// It returns the local index of where the result of the expression is stored.
    ///
    /// It takes a context which is a list of symbols that are in scope and their index in the
    /// locals.
    fn generate_instructions_for_expr(
        &mut self,
        context: &[(u32, &str)],
        expr: &validator::Expression,
        locals: &mut WasmFunctionLocals,
        instrs: &mut Vec<Instruction>,
    ) -> Result<u32, String> {
        let local_idx = locals.add_local(ValType::I32);
        let functions = self.functions.as_mut().unwrap();

        match expr {
            validator::Expression::FunctionApplication { params, is_partial } => match &params[0] {
                validator::Expression::Symbol(sym) => self.make_thunk_from_symbol(
                    instrs,
                    locals,
                    local_idx,
                    context,
                    &sym.as_ref().borrow(),
                    &params[1..],
                ),
                validator::Expression::ScopeSymbol(name) => self.make_thunk_from_func_param(
                    instrs,
                    locals,
                    local_idx,
                    context,
                    name,
                    (&params[1..], *is_partial),
                ),
                validator::Expression::LambdaAbstraction(_params, _body) => unimplemented!(),
                s => unreachable!("Function application not supported: {:?}", s),
            },
            validator::Expression::ScopeSymbol(name) => {
                let (sym_idx, _) = context.iter().find(|(_, s)| s == name).ok_or(format!(
                    "Symbol {} not accessible in the lambda abstraction",
                    name
                ))?;
                Ok(*sym_idx)
            }
            validator::Expression::Symbol(sym) => {
                let make_pap_idx = functions
                    .function_index(":make_pap")
                    .ok_or("Function make_pap not found in the function table")?;
                let make_thunk_idx = functions
                    .function_index(":make_thunk")
                    .ok_or("Function make_thunk not found in the function table")?;

                let sym = sym.as_ref().borrow();
                let (name, remove_return_when_unit) = if sym.import_module_name() == Some("foreign")
                {
                    (format!(":imported_{}", &sym.name), true)
                } else {
                    (sym.name.clone(), false)
                };

                let sym_tbl_idx = functions
                    .table_index(&name)
                    .ok_or(format!("Function {} not found in the function table", name))?;
                let sym_ty_idx = self.func_ty_idx_from_symbol(&sym, remove_return_when_unit)?;
                let total_params = sym.arity();

                self.make_env_wrapper(context, locals, instrs, local_idx, Some(sym_tbl_idx), &[])?;

                if total_params == 0 {
                    instrs.push(Instruction::I32Const(sym_ty_idx as i32));
                    instrs.push(Instruction::LocalGet(local_idx));
                    instrs.push(Instruction::Call(make_thunk_idx));
                } else {
                    instrs.push(Instruction::I32Const(sym_ty_idx as i32)); // function type index
                    instrs.push(Instruction::I32Const(total_params as i32)); // number of params
                    instrs.push(Instruction::I32Const(0)); // number of applied params
                    instrs.push(Instruction::LocalGet(local_idx)); // env pointer
                    instrs.push(Instruction::Call(make_pap_idx));
                }

                instrs.push(Instruction::LocalSet(local_idx));
                Ok(local_idx)
            }
            validator::Expression::IntLiteral(val) => {
                let make_val_idx = functions
                    .function_index(":make_val")
                    .ok_or("Function make_val not found in the function table")?;

                instrs.push(Instruction::I32Const(0));
                instrs.push(Instruction::I32Const(*val));
                instrs.push(Instruction::Call(make_val_idx));
                instrs.push(Instruction::LocalSet(local_idx));
                Ok(local_idx)
            }
            validator::Expression::CharLiteral(val) => {
                let make_val_idx = functions
                    .function_index(":make_val")
                    .ok_or("Function make_val not found in the function table")?;

                instrs.push(Instruction::I32Const(0));
                instrs.push(Instruction::I32Const(*val as i32));
                instrs.push(Instruction::Call(make_val_idx));
                instrs.push(Instruction::LocalSet(local_idx));
                Ok(local_idx)
            }
            validator::Expression::StringLiteral(val) => {
                let cons_idx = functions
                    .function_index("Cons")
                    .ok_or("Function Cons not found in the function table")?;

                let nil_idx = functions
                    .function_index("Nil")
                    .ok_or("Function Nil not found in the function table")?;

                let make_val_idx = functions
                    .function_index(":make_val")
                    .ok_or("Function make_val not found in the function table")?;

                instrs.push(Instruction::Call(nil_idx));
                instrs.push(Instruction::LocalSet(local_idx));

                for c in val.chars().rev() {
                    instrs.push(Instruction::I32Const(0));
                    instrs.push(Instruction::I32Const(c as i32));
                    instrs.push(Instruction::Call(make_val_idx));
                    instrs.push(Instruction::LocalGet(local_idx));
                    instrs.push(Instruction::Call(cons_idx));
                    instrs.push(Instruction::LocalSet(local_idx));
                }

                Ok(local_idx)
            }
            validator::Expression::UnitValue => {
                let make_val_idx = functions
                    .function_index(":make_val")
                    .ok_or("Function make_val not found in the function table")?;

                instrs.push(Instruction::I32Const(0));
                instrs.push(Instruction::I32Const(0));
                instrs.push(Instruction::Call(make_val_idx));
                instrs.push(Instruction::LocalSet(local_idx));
                Ok(local_idx)
            }
            validator::Expression::CaseExpression(validator::CaseExpression {
                input_expr,
                branches,
                ..
            }) => {
                instrs.push(Instruction::Block(BlockType::Empty));

                let input_local_idx =
                    self.generate_instructions_for_expr(context, input_expr, locals, instrs)?;

                for branch in branches {
                    let validator::CaseBranch {
                        pattern,
                        branch_expr,
                    } = branch;

                    instrs.push(Instruction::Block(BlockType::Empty));

                    let mut scope = context.to_vec();
                    self.generate_instructions_for_case_branch(
                        input_local_idx,
                        &mut scope,
                        pattern,
                        locals,
                        instrs,
                    )?;

                    let branch_local_idx =
                        self.generate_instructions_for_expr(&scope, branch_expr, locals, instrs)?;

                    instrs.push(Instruction::LocalGet(branch_local_idx));
                    instrs.push(Instruction::LocalSet(local_idx));
                    instrs.push(Instruction::Br(1)); // if the branch is taken, skip the rest of the case block
                    instrs.push(Instruction::End); // end of the branch
                }

                instrs.push(Instruction::Unreachable); // if no branch is taken, the program is in an invalid state
                instrs.push(Instruction::End); // end of the case block

                Ok(local_idx)
            }
            validator::Expression::Tuple(exprs) => {
                let make_env_idx = functions
                    .function_index(":make_env")
                    .ok_or("Function make_env not found in the function table")?;
                let make_val_idx = functions
                    .function_index(":make_val")
                    .ok_or("Function make_val not found in the function table")?;

                instrs.push(Instruction::I32Const((exprs.len() + 1) as i32));
                instrs.push(Instruction::Call(make_env_idx));
                instrs.push(Instruction::LocalSet(local_idx));

                instrs.push(Instruction::LocalGet(local_idx));
                instrs.push(Instruction::I32Const(exprs.len() as i32));
                instrs.push(Instruction::I32Store(MemArg {
                    align: 2,
                    offset: 0,
                    memory_index: 0,
                }));

                instrs.push(Instruction::LocalGet(local_idx));
                instrs.push(Instruction::I32Const(0));
                instrs.push(Instruction::I32Store(MemArg {
                    align: 2,
                    offset: 4,
                    memory_index: 0,
                }));

                for (i, expr) in exprs.iter().enumerate() {
                    let rec_local_idx =
                        self.generate_instructions_for_expr(context, expr, locals, instrs)?;
                    instrs.push(Instruction::LocalGet(local_idx));
                    instrs.push(Instruction::LocalGet(rec_local_idx));
                    instrs.push(Instruction::I32Store(MemArg {
                        align: 2,
                        offset: ((i + 2) * 4) as u64,
                        memory_index: 0,
                    }));
                }

                instrs.push(Instruction::I32Const(1));
                instrs.push(Instruction::LocalGet(local_idx));
                instrs.push(Instruction::Call(make_val_idx));
                instrs.push(Instruction::LocalSet(local_idx));

                Ok(local_idx)
            }
            validator::Expression::LambdaAbstraction(_, _) => unimplemented!("Lambda abstraction"),
        }
    }

    /// Generates the code for a case branch pattern.
    fn generate_instructions_for_case_branch<'a>(
        &mut self,
        input_local_idx: u32,
        context: &mut Vec<(u32, &'a str)>,
        pattern: &'a validator::CaseBranchPattern,
        locals: &mut WasmFunctionLocals,
        instrs: &mut Vec<Instruction>,
    ) -> Result<(), String> {
        let eval_idx = self
            .functions
            .as_mut()
            .unwrap()
            .function_index(":eval")
            .ok_or("Function eval not found in the function table")?;

        match pattern {
            validator::CaseBranchPattern::Wildcard => {}
            validator::CaseBranchPattern::Unit => {
                let eval_local_idx = locals.add_local(ValType::I32);
                instrs.push(Instruction::LocalGet(input_local_idx));
                instrs.push(Instruction::Call(eval_idx));
                instrs.push(Instruction::I32Load(MemArg {
                    // load data constructor env
                    align: 2,
                    offset: 1,
                    memory_index: 0,
                }));
                instrs.push(Instruction::LocalTee(eval_local_idx)); // store the data constructor env

                instrs.push(Instruction::I32Load(MemArg {
                    // load data constructor index
                    align: 2,
                    offset: 4,
                    memory_index: 0,
                }));

                instrs.push(Instruction::I32Const(0));
                instrs.push(Instruction::I32Ne);
                instrs.push(Instruction::BrIf(0)); // if the input is not equal to the expected value, skip the branch
            }
            validator::CaseBranchPattern::AsPattern(var_name, as_pattern) => {
                let var_local_idx = locals.add_local(ValType::I32);

                instrs.push(Instruction::LocalGet(input_local_idx));
                instrs.push(Instruction::LocalSet(var_local_idx));

                context.push((var_local_idx, var_name));

                if let Some(as_pattern) = as_pattern {
                    self.generate_instructions_for_case_branch(
                        input_local_idx,
                        context,
                        as_pattern,
                        locals,
                        instrs,
                    )?;
                }
            }
            validator::CaseBranchPattern::IntLiteral(val) => {
                let eval_local_idx = locals.add_local(ValType::I32);

                instrs.push(Instruction::LocalGet(input_local_idx));
                instrs.push(Instruction::Call(eval_idx));
                instrs.push(Instruction::I32Load(MemArg {
                    // load data constructor env
                    align: 2,
                    offset: 1,
                    memory_index: 0,
                }));
                instrs.push(Instruction::LocalTee(eval_local_idx)); // store the data constructor env

                instrs.push(Instruction::I32Const(*val));
                instrs.push(Instruction::I32Ne);
                instrs.push(Instruction::BrIf(0)); // if the input is not equal to the expected value, skip the branch
            }
            validator::CaseBranchPattern::Constructor {
                data_constructor,
                fields,
            } => {
                let data_constructor_idx = data_constructor
                    .as_ref()
                    .borrow()
                    .data_constructor_idx
                    .unwrap();

                let eval_local_idx = locals.add_local(ValType::I32);

                instrs.push(Instruction::LocalGet(input_local_idx));
                instrs.push(Instruction::Call(eval_idx));
                instrs.push(Instruction::I32Load(MemArg {
                    // load data constructor env
                    align: 2,
                    offset: 1,
                    memory_index: 0,
                }));
                instrs.push(Instruction::LocalTee(eval_local_idx)); // store the data constructor env

                instrs.push(Instruction::I32Load(MemArg {
                    // load data constructor index
                    align: 2,
                    offset: 4,
                    memory_index: 0,
                }));

                instrs.push(Instruction::I32Const(data_constructor_idx as i32));
                instrs.push(Instruction::I32Ne);
                instrs.push(Instruction::BrIf(0)); // if the data constructor index is not equal to the expected one, skip the branch

                for (i, field) in fields.iter().enumerate() {
                    let field_local_idx = locals.add_local(ValType::I32);

                    instrs.push(Instruction::LocalGet(eval_local_idx));
                    instrs.push(Instruction::I32Load(MemArg {
                        align: 2,
                        offset: ((i + 2) * 4) as u64,
                        memory_index: 0,
                    }));
                    instrs.push(Instruction::LocalSet(field_local_idx));

                    self.generate_instructions_for_case_branch(
                        field_local_idx,
                        context,
                        field,
                        locals,
                        instrs,
                    )?;
                }
            }
            validator::CaseBranchPattern::Tuple(patterns) => {
                for (i, pattern) in patterns.iter().enumerate() {
                    let eval_local_idx = locals.add_local(ValType::I32);
                    instrs.push(Instruction::LocalGet(input_local_idx));
                    instrs.push(Instruction::Call(eval_idx));
                    instrs.push(Instruction::I32Load(MemArg {
                        // load data constructor env
                        align: 2,
                        offset: 1,
                        memory_index: 0,
                    }));
                    instrs.push(Instruction::LocalTee(eval_local_idx)); // store the data constructor env

                    let field_local_idx = locals.add_local(ValType::I32);
                    instrs.push(Instruction::I32Load(MemArg {
                        align: 2,
                        offset: ((i + 2) * 4) as u64,
                        memory_index: 0,
                    }));
                    instrs.push(Instruction::LocalSet(field_local_idx));

                    self.generate_instructions_for_case_branch(
                        field_local_idx,
                        context,
                        pattern,
                        locals,
                        instrs,
                    )?;
                }
            }
        }

        Ok(())
    }

    /// Function that generates the code for creating a environment for a thunk or partial
    /// application (PAP).
    ///
    /// The environment is created by calling the `:make_env` function. The environment is then
    /// stored in the local variable at `local_idx` and the parameters are stored in the
    /// environment. The first element in the environment is the function table index if present
    /// (for thunks) and the rest of the elements are the parameters.
    fn make_env_wrapper(
        &mut self,
        context: &[(u32, &str)],
        locals: &mut WasmFunctionLocals,
        instrs: &mut Vec<Instruction>,
        local_idx: u32,
        func_idx: Option<u32>,
        params: &[validator::Expression],
    ) -> Result<(), String> {
        let make_env_idx = self
            .functions
            .as_mut()
            .unwrap()
            .function_index(":make_env")
            .expect("Function make_env not found in the function table");

        instrs.push(Instruction::I32Const(
            (params.len() - (if func_idx.is_none() { 1 } else { 0 })) as i32,
        ));
        instrs.push(Instruction::Call(make_env_idx));
        instrs.push(Instruction::LocalSet(local_idx));

        if let Some(func_idx) = func_idx {
            instrs.push(Instruction::LocalGet(local_idx));
            instrs.push(Instruction::I32Const(func_idx as i32));
            instrs.push(Instruction::I32Store(MemArg {
                align: 2,
                offset: 0,
                memory_index: 0,
            }));
        };

        for (i, param) in params.iter().enumerate() {
            let rec_local_idx =
                self.generate_instructions_for_expr(context, param, locals, instrs)?;
            instrs.push(Instruction::LocalGet(local_idx));
            instrs.push(Instruction::LocalGet(rec_local_idx));
            instrs.push(Instruction::I32Store(MemArg {
                align: 2,
                offset: ((i + if func_idx.is_none() { 0 } else { 1 }) * 4) as u64,
                memory_index: 0,
            }));
        }

        Ok(())
    }

    /// Function that generates the code for creating a thunk from a function application where the
    /// function is a symbol.
    fn make_thunk_from_symbol(
        &mut self,
        instrs: &mut Vec<Instruction>,
        locals: &mut WasmFunctionLocals,
        local_idx: u32,
        context: &[(u32, &str)],
        func: &validator::Symbol,
        params: &[validator::Expression],
    ) -> Result<u32, String> {
        let num_params = params.len();

        let functions = self.functions.as_mut().unwrap();
        let make_thunk_idx = functions
            .function_index(":make_thunk")
            .ok_or("Function make_thunk not found in the function table")?;
        let make_pap_idx = functions
            .function_index(":make_pap")
            .ok_or("Function make_pap not found in the function table")?;

        let (name, remove_return_when_unit) = if func.import_module_name() == Some("foreign") {
            (format!(":imported_{}", &func.name), true)
        } else {
            (func.name.clone(), false)
        };
        let func_tbl_idx = functions
            .table_index(&name)
            .ok_or(format!("Function {} not found in the function table", name))?;
        let func_ty_idx = self.func_ty_idx_from_symbol(func, remove_return_when_unit)?;

        self.make_env_wrapper(
            context,
            locals,
            instrs,
            local_idx,
            Some(func_tbl_idx),
            params,
        )?;

        if num_params != func.arity() as usize {
            instrs.push(Instruction::I32Const(func_ty_idx as i32));
            instrs.push(Instruction::I32Const(func.arity().into()));
            instrs.push(Instruction::I32Const(num_params as i32));
            instrs.push(Instruction::LocalGet(local_idx));
            instrs.push(Instruction::Call(make_pap_idx));
        } else {
            instrs.push(Instruction::I32Const(func_ty_idx as i32));
            instrs.push(Instruction::LocalGet(local_idx));
            instrs.push(Instruction::Call(make_thunk_idx));
        }
        instrs.push(Instruction::LocalSet(local_idx));

        Ok(local_idx)
    }

    /// Function that generates the code for creating a thunk from a function application where the
    /// function is a lambda parameter.
    ///
    /// If the function is partially applied, the parameters are simply added to the PAP (using
    /// `:add_to_pap`). If the function is not partially applied, the parameters are wrapped in a
    /// environment and the `:make_thunk_from_pap` function is called.
    fn make_thunk_from_func_param(
        &mut self,
        instrs: &mut Vec<Instruction>,
        locals: &mut WasmFunctionLocals,
        local_idx: u32,
        context: &[(u32, &str)],
        func_name: &str,
        (params, is_partial): (&[validator::Expression], bool),
    ) -> Result<u32, String> {
        let functions = self.functions.as_ref().unwrap();
        let make_thunk_from_pap_idx = functions
            .function_index(":make_thunk_from_pap")
            .ok_or("Function make_thunk_from_pap not found in the function table")?;
        let add_to_pap_idx = functions
            .function_index(":add_to_pap")
            .ok_or("Function add_to_pap not found in the function table")?;

        let (pap_local_idx, _) = context
            .iter()
            .find(|(_, s)| **s == *func_name)
            .ok_or(format!(
                "Function {} not accessible in the lambda abstraction",
                func_name
            ))?;

        if is_partial {
            println!("Partial application for functions passed as parameters is unstable");
            for param in params {
                let rec_local_idx =
                    self.generate_instructions_for_expr(context, param, locals, instrs)?;
                instrs.push(Instruction::LocalGet(*pap_local_idx));
                instrs.push(Instruction::LocalGet(rec_local_idx));
                instrs.push(Instruction::Call(add_to_pap_idx));
                instrs.push(Instruction::LocalSet(*pap_local_idx));
            }
            instrs.push(Instruction::LocalGet(*pap_local_idx));
        } else {
            self.make_env_wrapper(context, locals, instrs, local_idx, None, params)?;

            instrs.push(Instruction::LocalGet(*pap_local_idx));
            instrs.push(Instruction::LocalGet(local_idx));
            instrs.push(Instruction::Call(make_thunk_from_pap_idx));
        }
        instrs.push(Instruction::LocalSet(local_idx));

        Ok(local_idx)
    }

    /// Generates the code for the apply function.
    fn generate_apply_function(&mut self) -> Result<u32, String> {
        let functions = self.functions.as_mut().unwrap();

        let make_val_idx = functions
            .function_index(":make_val")
            .expect("Function make_val not found");

        let apply_ty_idx = self
            .function_types
            .function_type_idx(vec![ValType::I32, ValType::I32], Some(ValType::I32))
            .unwrap();
        // DeclaredWasmFunctions insures that the apply function has table index 0 so that it can
        // be called by eval
        let apply_func_idx = functions
            .add_function(":apply", apply_ty_idx)
            .expect("Function apply already exists");

        let mut instrs = vec![];

        for (idx, (params, ret_ty)) in self.function_types.types_iter() {
            instrs.push(Instruction::LocalGet(0));
            instrs.push(Instruction::I32Const(idx as i32));
            instrs.push(Instruction::I32Eq);
            instrs.push(Instruction::If(BlockType::Empty));
            for j in 0..params.len() {
                instrs.push(Instruction::LocalGet(1));
                instrs.push(Instruction::I32Load(MemArg {
                    align: 2,
                    offset: (4 * (j + 1)) as u64,
                    memory_index: 0,
                }));
            }
            instrs.push(Instruction::LocalGet(1));
            instrs.push(Instruction::I32Load(MemArg {
                align: 2,
                offset: 0,
                memory_index: 0,
            }));
            instrs.push(Instruction::CallIndirect {
                type_index: idx,
                table_index: 0,
            });

            if ret_ty.is_none() {
                instrs.push(Instruction::I32Const(0));
                instrs.push(Instruction::I32Const(0));
                instrs.push(Instruction::Call(make_val_idx));
            }

            instrs.push(Instruction::Return);
            instrs.push(Instruction::End);
        }

        instrs.push(Instruction::Unreachable);
        instrs.push(Instruction::End);

        let mut f = Function::new(vec![]);
        instrs.iter().for_each(|instr| {
            f.instruction(instr);
        });

        self.code_section.function(&f);
        Ok(apply_func_idx)
    }
}

/// Generates the code for the given symbol table. Returns the generated code as a vector of bytes.
pub fn generate_code(
    symbol_table: validator::SymbolTable,
    print_wasm: bool,
    show_offset: bool,
) -> Result<Vec<u8>, String> {
    CodeGen::generate(symbol_table, print_wasm, show_offset)
}
