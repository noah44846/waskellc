// SPDX-License-Identifier: MIT

use std::rc::Rc;

use wasm_encoder::*;

use crate::code_gen::encoder_wrapper::{
    DeclaredWasmFunctionTypes, DeclaredWasmFunctions, DeclaredWasmImports,
};

use crate::validator;

struct CodeGen {
    code_section: CodeSection,
    function_types: DeclaredWasmFunctionTypes,
    imports: Option<DeclaredWasmImports>,
    functions: Option<DeclaredWasmFunctions>,
    symbol_table: Rc<validator::SymbolTable>,
}

impl CodeGen {
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

    fn handle_imports(&mut self) -> Result<(), String> {
        let imports = self.imports.as_mut().unwrap();

        let arg_1_int32_ret_int32 = self
            .function_types
            .function_type_idx(vec![ValType::I32], Some(ValType::I32))
            .unwrap();
        let arg_2_int32_no_ret = self
            .function_types
            .function_type_idx(vec![ValType::I32; 2], None)
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
            .import_func("lib", "eval", arg_1_int32_ret_int32)
            .unwrap();
        imports
            .import_func("lib", "make_env", arg_1_int32_ret_int32)
            .unwrap();
        imports
            .import_func("lib", "make_thunk", arg_2_int32_ret_int32)
            .unwrap();
        imports
            .import_func("lib", "make_pap", arg_4_int32_ret_int32)
            .unwrap();
        imports
            .import_func("lib", "add_to_pap", arg_2_int32_no_ret)
            .unwrap();
        imports
            .import_func("lib", "make_thunk_from_pap", arg_2_int32_ret_int32)
            .unwrap();
        imports
            .import_func("lib", "make_val", arg_1_int32_ret_int32)
            .unwrap();

        self.symbol_table
            .clone()
            .values()
            .map(|s| s.as_ref().borrow())
            .filter(|s| s.is_imported())
            .map(|s| {
                let ty_idx = self.func_ty_idx_from_symbol(&s, true)?;
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

    fn generate_functions(mut self) -> Result<Module, String> {
        self.symbol_table
            .clone()
            .values()
            .map(|s| s.as_ref().borrow())
            .filter(|s| !s.is_imported())
            .map(|s| match self.create_signature(&s) {
                Ok(_) => Ok(s),
                Err(e) => Err(e),
            })
            // collect to ensure that all the signatures are created before generating the function body
            .collect::<Result<Vec<_>, String>>()?
            .iter()
            .map(|s| self.generate_function_body(s))
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

        // TODO: consider more elegant way to handle the order in which the functions are added (function section and code section have to be in the same order)
        if symbol.is_exported() {
            let func_type = self.func_ty_idx_from_symbol(symbol, true)?;
            let exported_func_name = format!("exported_{}", symbol.name);
            self.functions
                .as_mut()
                .unwrap()
                .add_function(&exported_func_name, func_type);
            self.functions
                .as_mut()
                .unwrap()
                .export(&exported_func_name, &symbol.name);
        }

        Ok(())
    }

    fn generate_function_body(&mut self, symbol: &validator::Symbol) -> Result<(), String> {
        let mut locals = vec![];
        let mut instrs = vec![];

        let expr = symbol.expr.as_ref().ok_or(format!(
            "Function {} does not have an expression",
            symbol.name
        ))?;

        self.generate_instructions_from_top_level_expr(expr, &mut locals, &mut instrs, &symbol.ty)?;

        fn add_function_to_code_section(
            code_section: &mut CodeSection,
            locals: &[ValType],
            instrs: &[Instruction],
        ) {
            let mut rle_locals: Vec<(u32, ValType)> = vec![];
            if !locals.is_empty() {
                let mut count = 1;
                let mut prev = locals[0];
                for ty in locals.iter().skip(1) {
                    if prev == *ty {
                        count += 1;
                    } else {
                        rle_locals.push((count, prev));
                        count = 1;
                        prev = *ty;
                    }
                }
                rle_locals.push((count, prev));
            }

            let mut f = Function::new(rle_locals);
            instrs.iter().for_each(|instr| {
                f.instruction(instr);
            });

            code_section.function(&f);
        }

        add_function_to_code_section(&mut self.code_section, &locals, &instrs);

        if symbol.is_exported() {
            let mut instrs = vec![];
            self.generate_instructions_from_exported(symbol, &mut instrs)?;
            add_function_to_code_section(&mut self.code_section, &[], &instrs);
        }

        Ok(())
    }

    fn generate_instructions_from_exported(
        &mut self,
        sym: &validator::Symbol,
        instrs: &mut Vec<Instruction>,
    ) -> Result<(), String> {
        let exported_func_name = format!("exported_{}", &sym.name);
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
        let eval_idx = functions
            .function_index("eval")
            .ok_or("Function eval not found in the function table")?;
        let make_val_idx = functions
            .function_index("make_val")
            .ok_or("Function make_val not found in the function table")?;

        match &sym.ty {
            validator::Type::Function(params) => {
                let num_params = params.len() - 1;

                for i in 0..num_params {
                    instrs.push(Instruction::LocalGet(i as u32));
                    instrs.push(Instruction::Call(make_val_idx));
                }
                instrs.push(Instruction::Call(func_idx));
                instrs.push(Instruction::Call(eval_idx));

                if let validator::Type::Unit = params.last().unwrap() {
                    instrs.push(Instruction::Drop);
                }

                instrs.push(Instruction::End);
            }
            validator::Type::List(_) | validator::Type::Tuple(_) => todo!(),
            ty => {
                instrs.push(Instruction::Call(func_idx));
                instrs.push(Instruction::Call(eval_idx));

                if let validator::Type::Unit = ty {
                    instrs.push(Instruction::Drop);
                }

                instrs.push(Instruction::End);
            }
        };
        Ok(())
    }

    fn generate_foreign_import_wrapper(&mut self, sym: &validator::Symbol) -> Result<(), String> {
        let mut instrs = vec![];
        let func_name = format!("imported_{}", &sym.name);

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
            .function_index("make_val")
            .ok_or("Function make_val not found in the function table")?;
        let eval_idx = functions
            .function_index("eval")
            .ok_or("Function eval not found in the function table")?;

        for i in 0..sym.arity() {
            instrs.push(Instruction::LocalGet(i as u32));
            instrs.push(Instruction::Call(eval_idx));
        }

        instrs.push(Instruction::Call(func_idx));

        if let validator::Type::Function(params) = &sym.ty {
            if let validator::Type::Unit = params.last().unwrap() {
            } else {
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

    fn generate_instructions_from_top_level_expr(
        &mut self,
        expr: &validator::Expression,
        locals: &mut Vec<ValType>,
        instrs: &mut Vec<Instruction>,
        parent_ty: &validator::Type,
    ) -> Result<(), String> {
        match expr {
            validator::Expression::LambdaAbstraction(syms, body) => {
                let tys = if let validator::Type::Function(tys) = parent_ty {
                    tys
                } else {
                    unreachable!();
                };
                let typed_params = syms
                    .iter()
                    .map(|s| s.as_str())
                    .zip(tys.iter())
                    .collect::<Vec<_>>();
                let local_idx =
                    self.generate_instructions_for_expr(&typed_params, body, locals, instrs)?;
                instrs.push(Instruction::LocalGet(local_idx));
                instrs.push(Instruction::End);
            }
            validator::Expression::FunctionApplication(_) => {
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
                    .function_index("make_val")
                    .ok_or("Function make_val not found in the function table")?;

                instrs.push(Instruction::I32Const(*val as i32));
                instrs.push(Instruction::Call(make_val_idx));
                instrs.push(Instruction::End);
            }
            validator::Expression::CharLiteral(_) => todo!(),
            validator::Expression::StringLiteral(_) => todo!(),
            _ => todo!("Expression not supported or not implemented"),
        }
        Ok(())
    }

    fn generate_instructions_for_expr(
        &mut self,
        context: &[(&str, &validator::Type)],
        expr: &validator::Expression,
        locals: &mut Vec<ValType>,
        instrs: &mut Vec<Instruction>,
    ) -> Result<u32, String> {
        locals.push(ValType::I32);
        let local_idx = (locals.len() - 1) + context.len();
        let functions = self.functions.as_mut().unwrap();

        match expr {
            validator::Expression::FunctionApplication(params) => match &params[0] {
                validator::Expression::Symbol(sym) => self.make_thunk_from_symbol(
                    instrs,
                    locals,
                    local_idx as u32,
                    context,
                    &sym.as_ref().borrow(),
                    &params[1..],
                ),
                validator::Expression::FunctionParameter(name) => self.make_thunk_from_func_param(
                    instrs,
                    locals,
                    local_idx as u32,
                    context,
                    name,
                    &params[1..],
                ),
                validator::Expression::LambdaAbstraction(_params, _body) => {
                    todo!("Lambda abstraction as function application")
                }
                _ => unreachable!(),
            },
            validator::Expression::FunctionParameter(name) => {
                let sym_idx = context.iter().position(|(s, _)| s == name).ok_or(format!(
                    "Symbol {} not accessible in the lambda abstraction",
                    name
                ))?;
                Ok(sym_idx as u32)
            }
            validator::Expression::Symbol(sym) => {
                let make_pap_idx = functions
                    .function_index("make_pap")
                    .ok_or("Function make_pap not found in the function table")?;

                let sym = sym.as_ref().borrow();
                let (name, remove_return_when_unit) = if sym.import_module_name() == Some("foreign")
                {
                    (format!("imported_{}", &sym.name), true)
                } else {
                    (sym.name.clone(), false)
                };

                let sym_tbl_idx = functions
                    .table_index(&name)
                    .ok_or(format!("Function {} not found in the function table", name))?;
                let sym_ty_idx = self.func_ty_idx_from_symbol(&sym, remove_return_when_unit)?;
                let total_params = sym.arity();

                self.make_env_wrapper(
                    context,
                    locals,
                    instrs,
                    local_idx as u32,
                    Some(sym_tbl_idx),
                    &[],
                )?;

                instrs.push(Instruction::I32Const(sym_ty_idx as i32)); // function type index
                instrs.push(Instruction::I32Const(total_params as i32)); // number of params
                instrs.push(Instruction::I32Const(0)); // number of applied params
                instrs.push(Instruction::LocalGet(local_idx as u32)); // env pointer
                instrs.push(Instruction::Call(make_pap_idx));

                instrs.push(Instruction::LocalSet(local_idx as u32));
                Ok(local_idx as u32)
            }
            validator::Expression::IntLiteral(val) => {
                let make_val_idx = functions
                    .function_index("make_val")
                    .ok_or("Function make_val not found in the function table")?;

                instrs.push(Instruction::I32Const(*val as i32));
                instrs.push(Instruction::Call(make_val_idx));
                instrs.push(Instruction::LocalSet(local_idx as u32));
                Ok(local_idx as u32)
            }
            _ => todo!(),
        }
    }

    fn make_env_wrapper(
        &mut self,
        context: &[(&str, &validator::Type)],
        locals: &mut Vec<ValType>,
        instrs: &mut Vec<Instruction>,
        local_idx: u32,
        func_idx: Option<u32>,
        params: &[validator::Expression],
    ) -> Result<(), String> {
        let make_env_idx = self
            .functions
            .as_mut()
            .unwrap()
            .function_index("make_env")
            .expect("Function make_env not found in the function table");

        instrs.push(Instruction::I32Const(params.len() as i32));
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

    fn make_thunk_from_symbol(
        &mut self,
        instrs: &mut Vec<Instruction>,
        locals: &mut Vec<ValType>,
        local_idx: u32,
        context: &[(&str, &validator::Type)],
        func: &validator::Symbol,
        params: &[validator::Expression],
    ) -> Result<u32, String> {
        let num_params = params.len();

        let functions = self.functions.as_mut().unwrap();
        let make_thunk_idx = functions
            .function_index("make_thunk")
            .ok_or("Function make_thunk not found in the function table")?;
        let make_pap_idx = functions
            .function_index("make_pap")
            .ok_or("Function make_pap not found in the function table")?;

        let (name, remove_return_when_unit) = if func.import_module_name() == Some("foreign") {
            (format!("imported_{}", &func.name), true)
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

        if num_params != func.arity().into() {
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

    fn make_thunk_from_func_param(
        &mut self,
        instrs: &mut Vec<Instruction>,
        locals: &mut Vec<ValType>,
        local_idx: u32,
        context: &[(&str, &validator::Type)],
        func_name: &str,
        params: &[validator::Expression],
    ) -> Result<u32, String> {
        let functions = self.functions.as_ref().unwrap();
        let make_thunk_from_pap_idx = functions
            .function_index("make_thunk_from_pap")
            .ok_or("Function make_thunk_from_pap not found in the function table")?;
        let add_to_pap_idx = functions
            .function_index("add_to_pap")
            .ok_or("Function add_to_pap not found in the function table")?;

        let pap_local_idx = context
            .iter()
            .position(|(s, _)| *s == func_name)
            .ok_or(format!(
                "Function {} not found in the lambda abstraction",
                func_name
            ))?;
        let pap_tys = if let validator::Type::Function(tys) = context[pap_local_idx].1 {
            tys
        } else {
            unreachable!()
        };

        if pap_tys.len() - 1 != params.len() {
            for param in params {
                let rec_local_idx =
                    self.generate_instructions_for_expr(context, param, locals, instrs)?;
                instrs.push(Instruction::LocalGet(pap_local_idx as u32));
                instrs.push(Instruction::LocalGet(rec_local_idx));
                instrs.push(Instruction::Call(add_to_pap_idx));
                instrs.push(Instruction::LocalGet(pap_local_idx as u32));
            }
        } else {
            self.make_env_wrapper(context, locals, instrs, local_idx, None, params)?;

            instrs.push(Instruction::LocalGet(pap_local_idx as u32));
            instrs.push(Instruction::LocalGet(local_idx));
            instrs.push(Instruction::Call(make_thunk_from_pap_idx));
        }
        instrs.push(Instruction::LocalSet(local_idx));

        Ok(local_idx)
    }

    fn generate_apply_function(&mut self) -> Result<u32, String> {
        let functions = self.functions.as_mut().unwrap();

        let make_val_idx = functions
            .function_index("make_val")
            .expect("Function make_val not found");

        let apply_ty_idx = self
            .function_types
            .function_type_idx(vec![ValType::I32, ValType::I32], Some(ValType::I32))
            .unwrap();
        // DeclaredWasmFunctions insures that the apply function has table index 0 so that it can
        // be called by eval
        let apply_func_idx = functions
            .add_function("apply", apply_ty_idx)
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
            instrs.push(Instruction::CallIndirect { ty: idx, table: 0 });

            if ret_ty.is_none() {
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

pub fn generate_code(
    symbol_table: validator::SymbolTable,
    print_wasm: bool,
    show_offset: bool,
) -> Result<Vec<u8>, String> {
    CodeGen::generate(symbol_table, print_wasm, show_offset)
}
