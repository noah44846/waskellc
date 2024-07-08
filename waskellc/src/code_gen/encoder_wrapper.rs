// SPDX-License-Identifier: MIT

use std::collections::hash_map::{self, HashMap};

use wasm_encoder::*;

/// A wrapper for representing the type section of a wasm module for the wasm_encoder crate
pub struct DeclaredWasmFunctionTypes {
    /// A map from function types to their indices in the type section
    map: HashMap<(Vec<ValType>, Option<ValType>), u32>,
    /// The type section
    type_section: TypeSection,
}

impl DeclaredWasmFunctionTypes {
    /// Create a new DeclaredWasmFunctionTypes
    pub fn new() -> Self {
        DeclaredWasmFunctionTypes {
            map: HashMap::new(),
            type_section: TypeSection::new(),
        }
    }

    /// Get or create a function type index given the parameters and return type.
    pub fn function_type_idx(
        &mut self,
        params: Vec<ValType>,
        return_ty: Option<ValType>,
    ) -> Option<u32> {
        let key = (params.clone(), return_ty);
        if let hash_map::Entry::Vacant(e) = self.map.entry(key.clone()) {
            self.type_section.function(params, return_ty);
            let val = self.type_section.len() - 1;
            e.insert(val);
            return Some(val);
        }

        return self.map.get(&key).cloned();
    }

    /// Get an iterator over the function types and their indices
    pub fn types_iter(&self) -> impl Iterator<Item = (u32, (Vec<ValType>, Option<ValType>))> + '_ {
        self.map.iter().map(|(ty_idx, ty)| (*ty, ty_idx.clone()))
    }

    /// Consume the DeclaredWasmFunctionTypes and return the TypeSection
    pub fn type_section(self) -> TypeSection {
        self.type_section
    }
}

/// A wrapper for representing the imports of a wasm module for the wasm_encoder crate
///
/// This struct is later converted into a DeclaredWasmFunctions struct which contains the
/// function section, export section, and element section. The reason for this separation is
/// that the function indices of imported functions are always the first indices in the function
/// section, and the function indices of declared functions are always after the imported functions.
pub struct DeclaredWasmImports {
    /// The import section
    import_section: ImportSection,
    /// A map from function names to their indices in the function section
    map: HashMap<String, DeclaredWasmFunctionIndices>,
    /// The number of functions imported
    function_count: u32,
}

impl DeclaredWasmImports {
    /// Create a new DeclaredWasmImports
    pub fn new() -> Self {
        DeclaredWasmImports {
            import_section: ImportSection::new(),
            map: HashMap::new(),
            function_count: 0,
        }
    }

    /// Import a function given the module, name, and type index
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

    /// Import a memory given the module, name, and memory type
    pub fn import_memory(&mut self, module: &str, name: &str, ty: MemoryType) {
        self.import_section
            .import(module, name, EntityType::Memory(ty));
    }
}

impl From<DeclaredWasmImports> for DeclaredWasmFunctions {
    fn from(imports: DeclaredWasmImports) -> Self {
        DeclaredWasmFunctions {
            map: imports.map,
            current_function_index: imports.function_count,
            // The first function is the apply function
            table_functions_list: vec![0],
            import_section: imports.import_section,
            function_section: FunctionSection::new(),
            export_section: ExportSection::new(),
        }
    }
}

/// A representation of the function indices of declared functions.
#[derive(Debug)]
struct DeclaredWasmFunctionIndices {
    /// The index of the function in the function section
    function_index: u32,
    /// The index of the function in the table section (if it is in the table)
    table_index: Option<u32>,
    /// Whether the function is exported
    is_exported: bool,
}

/// A wrapper for representing the functions of a wasm module for the wasm_encoder crate
pub struct DeclaredWasmFunctions {
    /// A map from function names to their indices in the function section
    map: HashMap<String, DeclaredWasmFunctionIndices>,
    /// The current function index
    current_function_index: u32,
    /// The list of function indices in the table section
    table_functions_list: Vec<u32>,
    /// The import section
    import_section: ImportSection,
    /// The function section
    function_section: FunctionSection,
    /// The export section
    export_section: ExportSection,
}

impl DeclaredWasmFunctions {
    /// Add a function given the name and type index and return the function index.
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

    /// Get the function index given the name.
    pub fn function_index(&self, name: &str) -> Option<u32> {
        self.map.get(name).map(|i| i.function_index)
    }

    /// Get or create a table index given the name.
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

    /// Export a function given the name and export name and return the function index.
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

    /// Consume the DeclaredWasmFunctions and return the ImportSection, FunctionSection, ExportSection,
    pub fn finish(
        mut self,
        apply_func_idx: u32,
    ) -> (
        ImportSection,
        FunctionSection,
        ExportSection,
        ElementSection,
    ) {
        self.table_functions_list[0] = apply_func_idx;
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

/// A wrapper for representing the local variables of a wasm function for the wasm_encoder crate
#[derive(Debug, Clone, Default)]
pub struct WasmFunctionLocals {
    /// The vector of local variable types
    locals: Vec<ValType>,
    /// The current index of the local variable
    current_idx: u32,
}

impl WasmFunctionLocals {
    /// Create a new WasmFunctionLocals given the number of parameters
    pub fn new(num_params: u32) -> Self {
        WasmFunctionLocals {
            locals: Vec::new(),
            current_idx: num_params,
        }
    }

    /// Add a local variable given the type and return the index of the local variable.
    pub fn add_local(&mut self, ty: ValType) -> u32 {
        let idx = self.current_idx;
        self.locals.push(ty);
        self.current_idx += 1;
        idx
    }
}

impl From<WasmFunctionLocals> for wasm_encoder::Function {
    fn from(val: WasmFunctionLocals) -> Self {
        let mut rle_locals: Vec<(u32, ValType)> = vec![];
        if !val.locals.is_empty() {
            let mut count = 1;
            let mut prev = val.locals[0];
            for ty in val.locals.iter().skip(1) {
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

        Function::new(rle_locals)
    }
}
