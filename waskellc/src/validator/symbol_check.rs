// SPDX-License-Identifier: MIT

use std::{
    cell::RefCell,
    collections::{HashMap, HashSet},
    fmt,
    hash::{Hash, Hasher},
    rc::Rc,
};

use crate::ast_gen;
use crate::validator::type_check::flatten_function_ty;

use super::type_check::type_check_syms;

pub type SymbolTable = HashMap<String, Rc<RefCell<Symbol>>>;
type TypeConstructorTable = HashMap<String, Rc<RefCell<TypeConstructor>>>;

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
    pub data_constructor_idx: Option<usize>,
    pub is_foreign: IsForeign,
}

#[derive(PartialEq, Clone)]
struct TypeConstructor {
    pub name: String,
    pub data_constructors: Vec<Rc<RefCell<Symbol>>>,
}

impl fmt::Debug for TypeConstructor {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.debug_struct("TypeConstructor")
            .field("name", &self.name)
            .field(
                "data_constructors",
                &self
                    .data_constructors
                    .iter()
                    .map(|sym| {
                        let ty = sym.as_ref().borrow().ty.clone();
                        let tys = if let Type::Function(tys) = &ty {
                            &tys[..tys.len() - 1]
                        } else {
                            &[]
                        };

                        format!("{}: {:?}", sym.as_ref().borrow().name.clone(), tys)
                    })
                    .collect::<Vec<String>>(),
            )
            .finish()
    }
}

impl Hash for TypeConstructor {
    fn hash<H: Hasher>(&self, state: &mut H) {
        self.name.hash(state);
    }
}

impl Eq for TypeConstructor {}

impl Symbol {
    pub fn param_type(&self, i: usize) -> Option<&Type> {
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
    CustomType(String),
}

#[derive(PartialEq, Clone)]
pub enum Expression {
    IntLiteral(i32),
    StringLiteral(String),
    CharLiteral(char),
    UnitValue,
    Symbol(Rc<RefCell<Symbol>>),
    ScopeSymbol(String),
    FunctionApplication(Vec<Expression>),
    Tuple(Vec<Expression>),
    LambdaAbstraction(Vec<String>, Box<Expression>),
    CaseExpression(CaseExpression),
}

#[derive(Debug, PartialEq, Clone)]
pub struct CaseExpression {
    pub input_expr: Box<Expression>,
    pub input_ty: Box<Type>,
    pub branches: Vec<CaseBranch>,
}

#[derive(Debug, PartialEq, Clone)]
pub struct CaseBranch {
    pub pattern: CaseBranchPattern,
    pub branch_expr: Expression,
}

#[derive(PartialEq, Clone)]
pub enum CaseBranchPattern {
    IntLiteral(i32),
    AsPattern(String, Option<Box<CaseBranchPattern>>),
    Constructor {
        data_constructor: Rc<RefCell<Symbol>>,
        fields: Vec<CaseBranchPattern>,
    },
    Tuple(Vec<CaseBranchPattern>),
    Wildcard,
}

impl fmt::Debug for CaseBranchPattern {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            CaseBranchPattern::IntLiteral(i) => write!(f, "IntLiteral({})", i),
            CaseBranchPattern::AsPattern(name, pat) if f.alternate() => {
                write!(f, "AsPattern({}, {:#?})", name, pat)
            }
            CaseBranchPattern::AsPattern(name, pat) => {
                write!(f, "AsPattern({}, {:?})", name, pat)
            }
            CaseBranchPattern::Constructor {
                data_constructor,
                fields,
            } if f.alternate() => {
                write!(
                    f,
                    "Constructor({}, {:#?})",
                    data_constructor.as_ref().borrow().name,
                    fields
                )
            }
            CaseBranchPattern::Constructor {
                data_constructor,
                fields,
            } => write!(
                f,
                "Constructor({}, {:?})",
                data_constructor.as_ref().borrow().name,
                fields
            ),
            CaseBranchPattern::Tuple(pats) if f.alternate() => write!(f, "Tuple({:#?})", pats),
            CaseBranchPattern::Tuple(pats) => write!(f, "Tuple({:?})", pats),
            CaseBranchPattern::Wildcard => write!(f, "Wildcard"),
        }
    }
}

impl fmt::Debug for Expression {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Expression::IntLiteral(i) => write!(f, "IntLiteral({})", i),
            Expression::StringLiteral(s) => write!(f, "StringLiteral({})", s),
            Expression::CharLiteral(c) => write!(f, "CharLiteral({})", c),
            Expression::UnitValue => write!(f, "Unit"),
            Expression::Symbol(sym) => write!(f, "Symbol({})", sym.as_ref().borrow().name),
            Expression::ScopeSymbol(name) => write!(f, "FunctionParameter({})", name),
            Expression::Tuple(exprs) if f.alternate() => write!(f, "Tuple({:#?})", exprs),
            Expression::Tuple(exprs) => write!(f, "Tuple({:?})", exprs),
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
            Expression::CaseExpression(case_expr) if f.alternate() => {
                write!(f, "CaseExpression({:#?})", case_expr)
            }
            Expression::CaseExpression(case_expr) => {
                write!(f, "CaseExpression({:?})", case_expr)
            }
        }
    }
}

fn data_decl_to_symbol(
    data_decl: &ast_gen::DataDeclaration,
    symbol_table: &mut SymbolTable,
    type_constructor_table: &mut TypeConstructorTable,
) -> Result<(), String> {
    let ast_gen::DataDeclaration {
        ty_constructor,
        data_constructors,
    } = data_decl;

    if type_constructor_table.contains_key(ty_constructor) {
        return Err(format!(
            "Type constructor {} already exists",
            ty_constructor
        ));
    }

    let ty_constructor = Rc::new(RefCell::new(TypeConstructor {
        name: ty_constructor.clone(),
        data_constructors: vec![],
    }));

    type_constructor_table.insert(
        ty_constructor.as_ref().borrow().name.clone(),
        ty_constructor.clone(),
    );

    for (i, constructor) in data_constructors.iter().enumerate() {
        if symbol_table.contains_key(&constructor.name) {
            return Err(format!(
                "Data constructor {} already exists",
                constructor.name
            ));
        }

        let mut fields = constructor
            .fields
            .iter()
            .map(|ty| {
                parser_type_to_type(
                    type_constructor_table,
                    &ast_gen::Type(vec![ty.clone()]),
                    &constructor.name,
                )
            })
            .collect::<Result<Vec<Type>, String>>()?;

        // add constructor return type
        let ty = if fields.is_empty() {
            Type::CustomType(ty_constructor.as_ref().borrow().name.clone())
        } else {
            fields.push(Type::CustomType(
                ty_constructor.as_ref().borrow().name.clone(),
            ));
            Type::Function(fields)
        };

        let elem = Rc::new(RefCell::new(Symbol {
            name: constructor.name.clone(),
            ty,
            expr: None,
            data_constructor_idx: Some(i),
            is_foreign: IsForeign::NotForeign,
        }));
        ty_constructor
            .as_ref()
            .borrow_mut()
            .data_constructors
            .push(elem.clone());
        symbol_table.insert(constructor.name.clone(), elem.clone());
    }

    Ok(())
}

fn function_type_to_symbol(
    name: String,
    func_ty: &ast_gen::FunctionType,
    is_exported: bool,
    is_imported: bool,
    symbol_table: &mut SymbolTable,
    type_constructor_table: &mut TypeConstructorTable,
) -> Result<(), String> {
    if symbol_table.contains_key(&name) {
        return Err(format!("Symbol {} already exists", name));
    }

    let tys = func_ty
        .0
        .iter()
        .map(|ty| parser_type_to_type(type_constructor_table, ty, &name))
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
            data_constructor_idx: None,
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

fn parser_type_to_type(
    type_constructor_table: &mut TypeConstructorTable,
    parser_type: &ast_gen::Type,
    name: &str,
) -> Result<Type, String> {
    // TODO: add support for type applications
    if parser_type.0.len() > 1 {
        return Err("Type applications not supported yet".to_string());
    }

    if let Some(ty) = parser_type.0.first() {
        let ty = match ty {
            ast_gen::TypeApplicationElement::TypeConstructor(ty_con) => match ty_con.as_str() {
                "Int" => Type::Int,
                "Char" => Type::Char,
                // TODO: add support for type aliases
                "String" => Type::List(Box::new(Type::Char)),
                _ => {
                    if let Some(data_decl) = type_constructor_table.get(ty_con) {
                        Type::CustomType(data_decl.as_ref().borrow().name.clone())
                    } else {
                        return Err(format!("Type constructor {} not found", ty_con));
                    }
                }
            },
            ast_gen::TypeApplicationElement::Unit => Type::Unit,
            ast_gen::TypeApplicationElement::ParenthesizedType(ty) => {
                let mut res = vec![];
                for ty in &ty.0 {
                    res.push(parser_type_to_type(type_constructor_table, ty, name)?);
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
    func_decls: Vec<&ast_gen::FunctionDeclaration>,
    symbol_table: &mut SymbolTable,
) -> Result<(), String> {
    let ast_gen::FunctionDeclaration { name, lhs, .. } = func_decls[0];

    let symbol = symbol_table
        .get(name)
        .ok_or(format!("Function type signature for {} not found", name))?;
    let symbol = symbol.clone();

    if let Some(sym_names) = get_param_names_form_non_case_decl(&func_decls) {
        let expr = if sym_names.is_empty() {
            parser_expr_to_expr(&func_decls[0].rhs, &[], symbol_table)?
        } else {
            Expression::LambdaAbstraction(
                sym_names.clone(),
                Box::new(parser_expr_to_expr(
                    &func_decls[0].rhs,
                    sym_names.as_slice(),
                    symbol_table,
                )?),
            )
        };
        let mut symbol_ref = symbol.borrow_mut();
        symbol_ref.expr = Some(expr);
        return Ok(());
    }

    let sym_params = (0..lhs.len())
        .map(|i| {
            (
                format!(":{}_{}", name, i),
                symbol.as_ref().borrow().param_type(i).unwrap().clone(),
            )
        })
        .collect::<Vec<_>>();

    let (input_expr, input_ty) = if sym_params.len() == 1 {
        let (sym_name, ty) = sym_params.first().unwrap();
        (Expression::ScopeSymbol(sym_name.clone()), ty.clone())
    } else {
        (
            Expression::Tuple(
                sym_params
                    .iter()
                    .map(|(sym_name, _)| Expression::ScopeSymbol(sym_name.clone()))
                    .collect(),
            ),
            Type::Tuple(
                sym_params
                    .iter()
                    .map(|(_, ty)| ty.clone())
                    .collect::<Vec<_>>(),
            ),
        )
    };

    let mut case_expr = CaseExpression {
        input_expr: Box::new(input_expr),
        input_ty: Box::new(input_ty),
        branches: vec![],
    };

    for decl in func_decls {
        let ast_gen::FunctionDeclaration { lhs, rhs, .. } = decl;

        if lhs.len() != sym_params.len() {
            return Err(format!(
                "Function {} has different number of parameters in different declarations",
                name
            ));
        }

        let mut scope = sym_params
            .iter()
            .map(|(name, _)| name.clone())
            .collect::<HashSet<_>>();
        let mut patterns = vec![];
        for pattern in lhs {
            let pat = parser_pattern_to_branch_pattern(pattern, &mut scope, symbol_table)?;
            patterns.push(pat);
        }

        case_expr.branches.push(CaseBranch {
            pattern: if sym_params.len() == 1 {
                patterns[0].clone()
            } else {
                CaseBranchPattern::Tuple(patterns.clone())
            },
            branch_expr: parser_expr_to_expr(rhs, &Vec::from_iter(scope), symbol_table)?,
        });
    }

    let mut symbol_ref = symbol.borrow_mut();
    symbol_ref.expr = Some(Expression::LambdaAbstraction(
        sym_params.iter().map(|(name, _)| name.clone()).collect(),
        Box::new(Expression::CaseExpression(case_expr)),
    ));
    Ok(())
}

fn get_param_names_form_non_case_decl(
    func_decls: &[&ast_gen::FunctionDeclaration],
) -> Option<Vec<String>> {
    if func_decls.len() == 1 {
        return func_decls[0]
            .lhs
            .iter()
            .map(|lhs| {
                if let ast_gen::FunctionParameterPattern::AsPattern(name, _) = lhs {
                    Some(name.clone())
                } else if let ast_gen::FunctionParameterPattern::Wildcard = lhs {
                    Some("_".to_string())
                } else {
                    None
                }
            })
            .collect::<Option<Vec<String>>>();
    }
    None
}

fn parser_pattern_to_branch_pattern(
    pattern: &ast_gen::FunctionParameterPattern,
    scope: &mut HashSet<String>,
    symbol_table: &SymbolTable,
) -> Result<CaseBranchPattern, String> {
    match pattern {
        ast_gen::FunctionParameterPattern::AsPattern(param_name, as_pattern) => {
            let as_pattern = as_pattern
                .as_ref()
                .map(|p| parser_pattern_to_branch_pattern(p, scope, symbol_table))
                .transpose()?;

            scope.insert(param_name.clone());
            Ok(CaseBranchPattern::AsPattern(
                param_name.clone(),
                as_pattern.map(Box::new),
            ))
        }
        ast_gen::FunctionParameterPattern::IntegerLiteral(val) => {
            Ok(CaseBranchPattern::IntLiteral(*val))
        }
        ast_gen::FunctionParameterPattern::ConstructorPattern(constructor) => {
            let symbol = symbol_table
                .get(constructor)
                .ok_or(format!("Data constructor {} not found", constructor))?;

            if matches!(symbol.as_ref().borrow().ty.clone(), Type::Function(_)) {
                return Err(format!(
                    "Data constructor {} has too many fields",
                    constructor
                ));
            }

            Ok(CaseBranchPattern::Constructor {
                data_constructor: symbol.clone(),
                fields: vec![],
            })
        }
        ast_gen::FunctionParameterPattern::Wildcard => Ok(CaseBranchPattern::Wildcard),
        ast_gen::FunctionParameterPattern::ParenthesizedPattern(pattern) => {
            match pattern.as_ref() {
                ast_gen::Pattern::NegatedIntegerLiteral(val) => {
                    Ok(CaseBranchPattern::IntLiteral(-val))
                }
                ast_gen::Pattern::ConstructorPattern(constructor, fields) => {
                    let symbol = symbol_table
                        .get(constructor)
                        .ok_or(format!("Data constructor {} not found", constructor))?;

                    if let Type::Function(fields_ty) = symbol.as_ref().borrow().ty.clone() {
                        if fields_ty.len() - 1 != fields.len() {
                            return Err(format!(
                                "Data constructor {} has too many fields",
                                constructor
                            ));
                        }
                    } else {
                        return Err(format!(
                            "Data constructor {} does not have fields",
                            constructor
                        ));
                    }

                    let fields = fields
                        .iter()
                        .map(|field| parser_pattern_to_branch_pattern(field, scope, symbol_table))
                        .collect::<Result<Vec<_>, String>>()?;

                    Ok(CaseBranchPattern::Constructor {
                        data_constructor: symbol.clone(),
                        fields,
                    })
                }
                ast_gen::Pattern::FunctionParameterPattern(param) => {
                    parser_pattern_to_branch_pattern(param, scope, symbol_table)
                }
            }
        }
    }
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
                    .map(|s| Expression::ScopeSymbol(s.clone()))
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
        ast_gen::FunctionParameterExpression::Constructor(name) => {
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
    let mut type_constructor_table: TypeConstructorTable = HashMap::new();

    // TODO: replace this with a std lib
    let global_op_symbols = [
        Symbol {
            name: "+".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int, Type::Int]),
            expr: None,
            data_constructor_idx: None,
            is_foreign: IsForeign::LibImported,
        },
        Symbol {
            name: "-".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int, Type::Int]),
            expr: None,
            data_constructor_idx: None,
            is_foreign: IsForeign::LibImported,
        },
        Symbol {
            name: "*".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int, Type::Int]),
            expr: None,
            data_constructor_idx: None,
            is_foreign: IsForeign::LibImported,
        },
        Symbol {
            name: "/".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int, Type::Int]),
            expr: None,
            data_constructor_idx: None,
            is_foreign: IsForeign::LibImported,
        },
        Symbol {
            name: "negate".to_owned(),
            ty: Type::Function(vec![Type::Int, Type::Int]),
            expr: None,
            data_constructor_idx: None,
            is_foreign: IsForeign::LibImported,
        },
    ];

    for symbol in global_op_symbols.iter() {
        symbol_table.insert(symbol.name.clone(), Rc::new(RefCell::new(symbol.clone())));
    }

    // add data declarations to symbol table
    for decl in ast
        .0
        .iter()
        .filter(|decl| matches!(decl, ast_gen::TopDeclaration::DataDecl { .. }))
    {
        if let ast_gen::TopDeclaration::DataDecl(data_decl) = decl {
            data_decl_to_symbol(data_decl, &mut symbol_table, &mut type_constructor_table)?;
        } else {
            unreachable!()
        }
    }

    // add type signatures to symbol table
    for decl in ast
        .0
        .iter()
        .filter(|decl| matches!(decl, ast_gen::TopDeclaration::TypeSig { .. }))
    {
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
                &mut type_constructor_table,
            )?;
        } else {
            unreachable!()
        }
    }

    // add function declarations to symbol table (merge function decls with same name)
    ast.0
        .iter()
        .filter(|decl| matches!(decl, ast_gen::TopDeclaration::FunctionDecl(_)))
        .map(|decl| {
            if let ast_gen::TopDeclaration::FunctionDecl(func_decl) = decl {
                func_decl
            } else {
                unreachable!()
            }
        })
        .fold(HashMap::new(), |mut acc: HashMap<_, Vec<_>>, decl| {
            let name = decl.name.clone();
            if let Some(elem) = acc.get_mut(&name) {
                elem.push(decl);
            } else {
                acc.insert(name, vec![decl]);
            }
            acc
        })
        .into_values()
        .map(|decls| add_function_decl_to_symbol(decls, &mut symbol_table))
        .collect::<Result<Vec<_>, String>>()?;

    if debug_symbols {
        println!("Symbol Table:\n{:#?}", symbol_table);
        println!("Type Constructor Table:\n{:#?}", type_constructor_table);
    }

    // type check all symbols
    let type_checked_sym_tlb = type_check_syms(symbol_table)?;

    if debug_desugar {
        println!("Desugared Symbol Table:\n{:#?}", type_checked_sym_tlb);
        println!("Type Constructor Table:\n{:#?}", type_constructor_table);
    }

    Ok(type_checked_sym_tlb)
}
