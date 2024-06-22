// SPDX-License-Identifier: MIT

use std::collections::hash_map::{self, HashMap};

use wasm_encoder::*;

pub struct DeclaredWasmFunctionTypes {
    map: HashMap<(Vec<ValType>, Option<ValType>), u32>,
    type_section: TypeSection,
}

impl DeclaredWasmFunctionTypes {
    pub fn new() -> Self {
        DeclaredWasmFunctionTypes {
            map: HashMap::new(),
            type_section: TypeSection::new(),
        }
    }

    pub fn function_type(
        &mut self,
        params: Vec<ValType>,
        return_ty: Option<ValType>,
    ) -> Option<u32> {
        let key = (params.clone(), return_ty.clone());
        if let hash_map::Entry::Vacant(e) = self.map.entry(key.clone()) {
            self.type_section.function(params, return_ty.into_iter());
            let val = self.type_section.len() - 1;
            e.insert(val);
            return Some(val);
        }

        return self.map.get(&key).cloned();
    }

    pub fn type_section(self) -> TypeSection {
        self.type_section
    }
}

pub struct DeclaredWasmImports {
    import_section: ImportSection,
    map: HashMap<String, DeclaredWasmFunctionIndices>,
    function_count: u32,
}

impl DeclaredWasmImports {
    pub fn new() -> Self {
        DeclaredWasmImports {
            import_section: ImportSection::new(),
            map: HashMap::new(),
            function_count: 0,
        }
    }

    pub fn import_func(&mut self, module: &str, name: &str, ty: u32) -> Result<(), String> {
        if let hash_map::Entry::Vacant(e) = self.map.entry(name.to_string()) {
            self.import_section
                .import(module, name, EntityType::Function(ty));
            let val = self.function_count;
            e.insert(DeclaredWasmFunctionIndices {
                function_index: val,
                table_index: None,
                is_exported: false,
            });
            self.function_count += 1;

            return Ok(());
        }

        Err(format!("Function {} already exists", name))
    }

    pub fn import_memory(&mut self, module: &str, name: &str, ty: MemoryType) {
        self.import_section
            .import(module, name, EntityType::Memory(ty));
    }

    pub fn to_functions(self, apply_func_ty_idx: u32) -> DeclaredWasmFunctions {
        let mut res = DeclaredWasmFunctions {
            map: self.map,
            current_function_index: self.function_count,
            table_functions_list: vec![],
            import_section: self.import_section,
            function_section: FunctionSection::new(),
            export_section: ExportSection::new(),
        };

        res.add_function("apply", apply_func_ty_idx).unwrap();

        res
    }
}

#[derive(Debug)]
struct DeclaredWasmFunctionIndices {
    function_index: u32,
    table_index: Option<u32>,
    is_exported: bool,
}

pub struct DeclaredWasmFunctions {
    map: HashMap<String, DeclaredWasmFunctionIndices>,
    current_function_index: u32,
    table_functions_list: Vec<u32>,
    import_section: ImportSection,
    function_section: FunctionSection,
    export_section: ExportSection,
}

impl DeclaredWasmFunctions {
    pub fn add_function(&mut self, name: &str, ty_idx: u32) -> Option<u32> {
        if let hash_map::Entry::Vacant(e) = self.map.entry(name.to_string()) {
            self.function_section.function(ty_idx);

            let function_index = self.current_function_index;
            e.insert(DeclaredWasmFunctionIndices {
                function_index,
                table_index: None,
                is_exported: false,
            });

            self.current_function_index += 1;
            Some(function_index)
        } else {
            None
        }
    }

    pub fn function_index(&self, name: &str) -> Option<u32> {
        self.map.get(name).map(|i| i.function_index)
    }

    pub fn table_index(&mut self, name: &str) -> Option<u32> {
        if let hash_map::Entry::Occupied(e) = self.map.entry(name.to_string()) {
            if e.get().table_index.is_some() {
                return e.get().table_index;
            }

            let table_index = self.table_functions_list.len() as u32;
            let function_index = e.get().function_index;
            e.into_mut().table_index = Some(table_index);
            self.table_functions_list.push(function_index);
            Some(table_index)
        } else {
            None
        }
    }

    pub fn export(&mut self, name: &str, export_name: &str) -> Option<u32> {
        let declared_fn = self.map.get_mut(name)?;

        if declared_fn.is_exported {
            return Some(declared_fn.function_index);
        }

        self.export_section
            .export(export_name, ExportKind::Func, declared_fn.function_index);
        declared_fn.is_exported = true;

        Some(declared_fn.function_index)
    }

    pub fn finish(
        mut self,
    ) -> (
        ImportSection,
        FunctionSection,
        ExportSection,
        ElementSection,
    ) {
        let mut element_section = ElementSection::new();
        element_section.active(
            None,
            &ConstExpr::i32_const(0),
            Elements::Functions(&self.table_functions_list),
        );

        self.import_section.import(
            "lib",
            "table",
            EntityType::Table(TableType {
                element_type: RefType::FUNCREF,
                minimum: self.table_functions_list.len() as u64,
                maximum: None,
                table64: false,
            }),
        );

        (
            self.import_section,
            self.function_section,
            self.export_section,
            element_section,
        )
    }
}
