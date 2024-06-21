// SPDX-License-Identifier: MIT

use std::collections::hash_map::{self, HashMap};

use wasm_encoder::*;

pub struct DeclaredWasmFunctionTypes {
    map: HashMap<Vec<ValType>, u32>,
    type_section: TypeSection,
}

impl DeclaredWasmFunctionTypes {
    pub fn new() -> Self {
        DeclaredWasmFunctionTypes {
            map: HashMap::new(),
            type_section: TypeSection::new(),
        }
    }

    pub fn function_type(&mut self, tys: Vec<ValType>) -> Option<u32> {
        if tys.is_empty() {
            return None;
        }

        if let hash_map::Entry::Vacant(e) = self.map.entry(tys.clone()) {
            self.type_section
                .function(Vec::from(&tys[..tys.len() - 1]), vec![*tys.last().unwrap()]);
            let val = self.type_section.len() - 1;
            e.insert(val);
            return Some(val);
        }

        return self.map.get(&tys).cloned();
    }

    pub fn type_section(self) -> TypeSection {
        self.type_section
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
    pub fn new(
        import_section: ImportSection,
        imports: &[(&str, &str, u32)],
        apply_func_ty_idx: u32,
    ) -> Self {
        let mut res = DeclaredWasmFunctions {
            map: HashMap::new(),
            current_function_index: 0,
            table_functions_list: vec![],
            import_section,
            function_section: FunctionSection::new(),
            export_section: ExportSection::new(),
        };

        let import_len = res.import_section.len();
        for (module, name, ty) in imports {
            res.import_section
                .import(module, name, EntityType::Function(*ty));
            res.map.insert(
                name.to_string(),
                DeclaredWasmFunctionIndices {
                    function_index: res.import_section.len() - import_len - 1,
                    table_index: None,
                    is_exported: false,
                },
            );
        }
        res.current_function_index = res.import_section.len() - import_len;

        res.add_function("apply", apply_func_ty_idx).unwrap();
        res.table_index("apply").unwrap();

        res
    }

    pub fn exists(&self, name: &str) -> bool {
        self.map.contains_key(name)
    }

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

    pub fn export(&mut self, name: &str) -> Option<u32> {
        let declared_fn = self.map.get_mut(name)?;

        if declared_fn.is_exported {
            return Some(declared_fn.function_index);
        }

        self.export_section
            .export(name, ExportKind::Func, declared_fn.function_index);
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
