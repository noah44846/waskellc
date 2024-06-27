// SPDX-License-Identifier: MIT

use std::{cell::RefCell, collections::HashMap, fmt, rc::Rc};

use crate::ast_gen;
use crate::validator::type_check::flatten_function_ty;

use super::type_check::type_check_syms;

pub type SymbolTable = HashMap<String, Rc<RefCell<Symbol>>>;

#[derive(Debug, PartialEq, Clone)]
pub enum IsForeign {
    LibImported,
    ForeignImported,
    Exported,
    NotForeign,
}

#[derive(Debug, PartialEq, Clone)]
pub struct Symbol {
    pub name: String,
    pub ty: Type,
    pub expr: Option<Expression>,
    is_foreign: IsForeign,
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

    pub fn is_imported(&self) -> bool {
        matches!(
            self.is_foreign,
            IsForeign::LibImported | IsForeign::ForeignImported
        )
    }

    pub fn is_exported(&self) -> bool {
        matches!(self.is_foreign, IsForeign::Exported)
    }

    pub fn import_module_name(&self) -> Option<&'static str> {
        match self.is_foreign {
            IsForeign::ForeignImported => Some("foreign"),
            IsForeign::LibImported => Some("lib"),
            _ => None,
        }
    }
}

#[derive(Debug, PartialEq, Clone, Hash, Eq)]
pub enum Type {
    Int,
    Char,
    Function(Vec<Type>),
    List(Box<Type>),
    Tuple(Vec<Type>),
    Unit,
    TypeVar {
        var_name: String,
        ctx_symbol_name: String,
    },
    // custom type
}

#[derive(PartialEq, Clone)]
pub enum Expression {
    IntLiteral(i64),
    StringLiteral(String),
    CharLiteral(char),
    UnitValue,
    Symbol(Rc<RefCell<Symbol>>),
    FunctionParameter(String),
    FunctionApplication(Vec<Expression>),
    LambdaAbstraction(Vec<String>, Box<Expression>),
    // case expression...
}

impl fmt::Debug for Expression {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Expression::IntLiteral(i) => write!(f, "IntLiteral({})", i),
            Expression::StringLiteral(s) => write!(f, "StringLiteral({})", s),
            Expression::CharLiteral(c) => write!(f, "CharLiteral({})", c),
            Expression::UnitValue => write!(f, "Unit"),
            Expression::Symbol(sym) => write!(f, "Symbol({})", sym.as_ref().borrow().name),
            Expression::FunctionParameter(name) => write!(f, "FunctionParameter({})", name),
            Expression::FunctionApplication(exprs) if f.alternate() => {
                write!(f, "FunctionApplication({:#?})", exprs)
            }
            Expression::FunctionApplication(exprs) => {
                write!(f, "FunctionApplication({:?})", exprs)
            }
            Expression::LambdaAbstraction(params, expr) if f.alternate() => {
                write!(f, "LambdaAbstraction({:#?}, {:#?})", params, expr)
            }
            Expression::LambdaAbstraction(params, expr) => {
                write!(f, "LambdaAbstraction({:?}, {:?})", params, expr)
            }
        }
    }
}

fn function_type_to_symbol(
    name: String,
    func_ty: &ast_gen::FunctionType,
    is_exported: bool,
    is_imported: bool,
    symbol_table: &mut SymbolTable,
) -> Result<(), String> {
    if symbol_table.contains_key(&name) {
        return Err(format!("Symbol {} already exists", name));
    }

    let tys = func_ty
        .0
        .iter()
        .map(|ty| parser_type_to_type(ty, &name))
        .collect::<Result<Vec<Type>, String>>()?;

    let ty = if tys.len() == 1 {
        flatten_function_ty(&tys[0])?
    } else {
        flatten_function_ty(&Type::Function(tys))?
    };

    symbol_table.insert(
        name.clone(),
        Rc::new(RefCell::new(Symbol {
            name,
            ty,
            expr: None,
            is_foreign: if is_imported {
                IsForeign::ForeignImported
            } else if is_exported {
                IsForeign::Exported
            } else {
                IsForeign::NotForeign
            },
        })),
    );
    Ok(())
}

fn parser_type_to_type(parser_type: &ast_gen::Type, name: &str) -> Result<Type, String> {
    // TODO: add support for type applications
    for ty in &parser_type.0 {
        let ty = match ty {
            ast_gen::TypeApplicationElement::TypeConstructor(ty_con) => match ty_con.as_str() {
                "Int" => Type::Int,
                "Char" => Type::Char,
                "String" => Type::List(Box::new(Type::Char)),
                _ => todo!(),
            },
            ast_gen::TypeApplicationElement::Unit => Type::Unit,
            ast_gen::TypeApplicationElement::ParenthesizedType(ty) => {
                let mut res = vec![];
                for ty in &ty.0 {
                    res.push(parser_type_to_type(ty, name)?);
                }

                Type::Function(res)
            }
            ast_gen::TypeApplicationElement::TypeVariable(ty_var) => Type::TypeVar {
                var_name: ty_var.clone(),
                ctx_symbol_name: name.to_string(),
            },
        };

        return Ok(ty);
    }
    Err("No type found".to_string())
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
                if sym_params.contains(&param_name.clone()) {
                    return Err(format!("Duplicate parameter name {}", param_name));
                }
                let symbol_ref = symbol.as_ref().borrow();
                symbol_ref
                    .param_type(i)
                    .ok_or(format!("Function {} has too many parameters", name))?;

                sym_params.push(param_name.to_string());
            }
            ast_gen::FunctionParameterPattern::Wildcard => sym_params.push("_".to_string()),
            _ => todo!(),
        }
    }

    let expr = parser_expr_to_expr(rhs, &sym_params, symbol_table)?;
    let mut symbol_ref = symbol.as_ref().borrow_mut();
    if sym_params.is_empty() {
        symbol_ref.expr = Some(expr);
        return Ok(());
    }
    symbol_ref.expr = Some(Expression::LambdaAbstraction(sym_params, Box::new(expr)));
    Ok(())
}

fn parser_expr_to_expr(
    parser_expr: &ast_gen::Expression,
    scope: &[String],
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
    scope: &[String],
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
    scope: &[String],
    symbol_table: &SymbolTable,
) -> Result<Expression, String> {
    match fn_arg_expr {
        ast_gen::FunctionParameterExpression::Variable(name) => {
            if !scope.is_empty() {
                // check if the symbol is in the scope
                if let Some(expr) = scope
                    .iter()
                    .find(|s| **s == *name)
                    .map(|s| Expression::FunctionParameter(s.clone()))
                {
                    return Ok(expr);
                }
            }

            if let Some(symbol) = symbol_table.get(name) {
                Ok(Expression::Symbol(symbol.clone()))
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
        ast_gen::FunctionParameterExpression::Unit => Ok(Expression::UnitValue),
    }
}

pub fn validate(
    ast: ast_gen::TopDeclarations,
    debug_symbols: bool,
    debug_desugar: bool,
) -> Result<SymbolTable, String> {
    let mut symbol_table: SymbolTable = HashMap::new();

    // TODO: replace this with a std lib
    let global_op_symbols = [
        Symbol {
            name: "+".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int, Type::Int]),
            expr: None,
            is_foreign: IsForeign::LibImported,
        },
        Symbol {
            name: "-".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int, Type::Int]),
            expr: None,
            is_foreign: IsForeign::LibImported,
        },
        Symbol {
            name: "*".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int, Type::Int]),
            expr: None,
            is_foreign: IsForeign::LibImported,
        },
        Symbol {
            name: "/".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int, Type::Int]),
            expr: None,
            is_foreign: IsForeign::LibImported,
        },
        Symbol {
            name: "negate".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int]),
            expr: None,
            is_foreign: IsForeign::LibImported,
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

    if debug_symbols {
        println!("Symbol Table:\n{:#?}", symbol_table);
    }

    // type check all symbols
    type_check_syms(&mut symbol_table)?;

    if debug_desugar {
        println!("Desugared Symbol Table:\n{:#?}", symbol_table);
    }

    Ok(symbol_table)
}
