// SPDX-License-Identifier: MIT

//! This module for doing type checking and other validations on the AST of the Waskell programming language.

use std::{cell::RefCell, collections::HashMap, fmt, rc::Rc};

use crate::ast_gen;
use crate::validator::type_check::type_check_sym;

pub type SymbolTable = HashMap<String, Rc<RefCell<Symbol>>>;

#[derive(PartialEq, Clone)]
pub struct Symbol {
    pub name: String,
    pub ty: Type,
    pub expr: Option<Expression>,
    pub is_exported: bool,
    pub import_module_name: Option<&'static str>,
}

impl fmt::Debug for Symbol {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(
            f,
            "Symbol {{ name: {}, ty: {:?}, expr: {:#?}, is_exported: {}, is_imported: {:?} }}",
            self.name, self.ty, self.expr, self.is_exported, self.import_module_name,
        )
    }
}

impl Symbol {
    fn param_type(&self, i: usize) -> Option<&Type> {
        match self.ty {
            // lase argument is the return type
            Type::Function(ref params) if i < params.len() - 1 => params.get(i),
            _ => None,
        }
    }

    pub fn return_type(&self) -> Option<&Type> {
        match self.ty {
            Type::Function(ref params) => params.last(),
            _ => Some(&self.ty),
        }
    }

    pub fn arity(&self) -> u8 {
        match self.ty {
            Type::Function(ref params) => (params.len() - 1) as u8,
            _ => 0,
        }
    }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Type {
    Int,
    Float,
    Boolean,
    Char,
    String,
    Function(Vec<Type>),
    List(Box<Type>),
    Tuple(Vec<Type>),
    Unit,
    // custom type
}

#[derive(Debug, PartialEq, Clone)]
pub enum Expression {
    IntLiteral(i64),
    StringLiteral(String),
    CharLiteral(char),
    Symbol(Rc<RefCell<Symbol>>),
    FunctionParameter(String),
    FunctionApplication(Vec<Expression>),
    LambdaAbstraction(Vec<String>, Box<Expression>),
    // case expression...
}

fn parser_type_to_type(parser_type: &ast_gen::Type) -> Result<Type, String> {
    // TODO: add support for type applications
    for ty in &parser_type.0 {
        match ty {
            ast_gen::TypeApplicationElement::TypeConstructor(ty_con) => match ty_con.as_str() {
                "Int" => return Ok(Type::Int),
                "Float" => return Ok(Type::Float),
                "Boolean" => return Ok(Type::Boolean),
                "Char" => return Ok(Type::Char),
                "String" => return Ok(Type::String),
                _ => todo!(),
            },
            ast_gen::TypeApplicationElement::Unit => return Ok(Type::Unit),
        }
    }
    Err("No type found".to_string())
}

fn function_type_to_symbol(
    name: String,
    func_ty: &ast_gen::FunctionType,
    is_exported: bool,
    is_imported: bool,
    symbol_table: &mut SymbolTable,
) -> Result<(), String> {
    let tys = func_ty
        .0
        .iter()
        .map(parser_type_to_type)
        .collect::<Result<Vec<Type>, String>>()?;

    symbol_table.insert(
        name.clone(),
        Rc::new(RefCell::new(Symbol {
            name,
            ty: Type::Function(tys),
            expr: None,
            is_exported,
            import_module_name: if is_imported { Some("foreign") } else { None },
        })),
    );
    Ok(())
}

fn parser_expr_to_expr(
    parser_expr: &ast_gen::Expression,
    scope: &Vec<String>,
    symbol_table: &SymbolTable,
) -> Result<Expression, String> {
    match parser_expr {
        ast_gen::Expression::InfixedApplication(lhs, op, rhs) => {
            let lhs_expr = parser_lhs_expr_to_expr(lhs, scope, symbol_table)?;
            let rhs_expr = parser_expr_to_expr(rhs, scope, symbol_table)?;
            let op = symbol_table
                .get(&op.to_string())
                .ok_or(format!("Operator {} not found", op))?;
            Ok(Expression::FunctionApplication(vec![
                Expression::Symbol(op.clone()),
                lhs_expr,
                rhs_expr,
            ]))
        }
        ast_gen::Expression::NegatedExpr(expr) => {
            let expr = parser_expr_to_expr(expr, scope, symbol_table)?;
            let negate = symbol_table
                .get("negate")
                .ok_or("negate function not found")?;
            Ok(Expression::FunctionApplication(vec![
                Expression::Symbol(negate.clone()),
                expr,
            ]))
        }
        ast_gen::Expression::LeftHandSideExpression(lhs) => {
            parser_lhs_expr_to_expr(lhs, scope, symbol_table)
        }
    }
}

fn parser_lhs_expr_to_expr(
    lhs_expr: &ast_gen::LeftHandSideExpression,
    scope: &Vec<String>,
    symbol_table: &SymbolTable,
) -> Result<Expression, String> {
    match lhs_expr {
        ast_gen::LeftHandSideExpression::FunctionApplication(params) => {
            if params.is_empty() {
                return Err("Function application must have at least one parameter".to_string());
            }

            let mut param_iter = params.iter();
            if params.len() == 1 {
                let param = param_iter.next().unwrap();
                return parser_fn_param_expr_to_expr(param, scope, symbol_table);
            }

            let mut exprs = vec![];
            for param in param_iter {
                let expr = parser_fn_param_expr_to_expr(param, scope, symbol_table)?;
                exprs.push(expr);
            }

            Ok(Expression::FunctionApplication(exprs))
        }
    }
}

fn parser_fn_param_expr_to_expr(
    fn_arg_expr: &ast_gen::FunctionParameterExpression,
    scope: &Vec<String>,
    symbol_table: &SymbolTable,
) -> Result<Expression, String> {
    match fn_arg_expr {
        ast_gen::FunctionParameterExpression::Variable(name) => {
            if let Some(symbol) = symbol_table.get(name) {
                Ok(Expression::Symbol(symbol.clone()))
            } else if !scope.is_empty() {
                // check if the symbol is in the scope
                Ok(scope
                    .iter()
                    .find(|s| **s == *name)
                    .map(|s| Expression::FunctionParameter(s.clone()))
                    .ok_or(format!("Symbol {} not found", name))?)
            } else {
                Err(format!("Symbol {} not found", name))
            }
        }
        ast_gen::FunctionParameterExpression::ParenthesizedExpr(expr) => {
            parser_expr_to_expr(expr, scope, symbol_table)
        }
        ast_gen::FunctionParameterExpression::IntegerLiteral(i) => Ok(Expression::IntLiteral(*i)),
        ast_gen::FunctionParameterExpression::StringLiteral(s) => {
            Ok(Expression::StringLiteral(s.clone()))
        }
        ast_gen::FunctionParameterExpression::CharLiteral(c) => Ok(Expression::CharLiteral(*c)),
        ast_gen::FunctionParameterExpression::Unit => todo!(),
    }
}

fn add_function_decl_to_symbol(
    func_decl: &ast_gen::FunctionDeclaration,
    symbol_table: &mut SymbolTable,
) -> Result<(), String> {
    let ast_gen::FunctionDeclaration { name, lhs, rhs } = func_decl;

    let symbol = symbol_table
        .get(name)
        .ok_or(format!("Function type signature for {} not found", name))?;
    let symbol = symbol.clone();

    let mut sym_params = vec![];
    for (i, param) in lhs.iter().enumerate() {
        match param {
            ast_gen::FunctionParameterPattern::AsPattern(param_name, None) => {
                let symbol_ref = (*symbol).borrow();
                symbol_ref
                    .param_type(i)
                    .ok_or(format!("Function {} has too many parameters", name))?;

                sym_params.push(param_name.to_string());
            }
            _ => todo!(),
        }
    }

    let expr = parser_expr_to_expr(rhs, &sym_params, symbol_table)?;
    let mut symbol_ref = (*symbol).borrow_mut();
    if sym_params.is_empty() {
        symbol_ref.expr = Some(expr);
        return Ok(());
    }
    symbol_ref.expr = Some(Expression::LambdaAbstraction(sym_params, Box::new(expr)));
    Ok(())
}

pub fn validate(ast: ast_gen::TopDeclarations) -> Result<SymbolTable, String> {
    let mut symbol_table: SymbolTable = HashMap::new();

    // TODO: replace this with a std lib
    let global_op_symbols = [
        Symbol {
            name: "+".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int, Type::Int]),
            expr: None,
            is_exported: false,
            import_module_name: Some("lib"),
        },
        Symbol {
            name: "-".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int, Type::Int]),
            expr: None,
            is_exported: false,
            import_module_name: Some("lib"),
        },
        Symbol {
            name: "*".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int, Type::Int]),
            expr: None,
            is_exported: false,
            import_module_name: Some("lib"),
        },
        Symbol {
            name: "/".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int, Type::Int]),
            expr: None,
            is_exported: false,
            import_module_name: Some("lib"),
        },
        Symbol {
            name: "negate".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int]),
            expr: None,
            is_exported: false,
            import_module_name: Some("lib"),
        },
    ];

    for symbol in global_op_symbols.iter() {
        symbol_table.insert(symbol.name.clone(), Rc::new(RefCell::new(symbol.clone())));
    }

    // add type signatures to symbol table
    ast.0
        .iter()
        .filter(|decl| matches!(decl, ast_gen::TopDeclaration::TypeSig { .. }))
        .for_each(|decl| {
            if let ast_gen::TopDeclaration::TypeSig {
                name,
                ty,
                is_exported,
                is_imported,
                ..
            } = decl
            {
                let is_exported = if name == "main" { true } else { *is_exported };
                function_type_to_symbol(
                    name.clone(),
                    ty,
                    is_exported,
                    *is_imported,
                    &mut symbol_table,
                )
                .unwrap();
            }
        });

    // add function declarations to symbol table
    ast.0
        .iter()
        .filter(|decl| matches!(decl, ast_gen::TopDeclaration::FunctionDecl(_)))
        .for_each(|decl| {
            if let ast_gen::TopDeclaration::FunctionDecl(func_decl) = decl {
                add_function_decl_to_symbol(func_decl, &mut symbol_table).unwrap();
            }
        });

    println!("{:#?}", symbol_table);

    // type check all symbols
    for (_, symbol) in symbol_table.iter() {
        type_check_sym(&symbol.borrow())?;
    }

    Ok(symbol_table)
}
