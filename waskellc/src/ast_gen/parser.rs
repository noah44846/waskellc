// SPDX-License-Identifier: MIT

use logos::Logos;

use crate::ast_gen::lexer::{Token, TokenIter};

/// Helper function to get the next token from the iterator and return it as a `Token` or an error.
///
/// If `peek` is `true`, the function will not consume the token from the iterator. If the lexer
/// has reached the end of the input or the character is invalid, an error will be returned.
fn next_token(iter: &mut TokenIter, peek: bool) -> Result<Token, String> {
    let next = if peek {
        iter.peek().cloned()
    } else {
        iter.next()
    };
    match next {
        Some(token) => token.map_err(|e| e.to_string()),
        None => Err("Unexpected end of input".to_string()),
    }
}

/// Represents a list of top-level declarations in a Haskell module.
#[derive(Debug)]
pub struct TopDeclarations(pub Vec<TopDeclaration>);

impl TopDeclarations {
    /// Parse a list of top-level declarations from the input token iterator.
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        let mut top_declarations = vec![];
        loop {
            top_declarations.push(TopDeclaration::parse(input)?);

            if input.peek().is_none() {
                break;
            }

            match next_token(input, true)? {
                Token::Special(';') => {
                    input.next(); // consume the ';'
                    if input.peek().is_none() {
                        break;
                    }
                }
                t => {
                    return Err(format!("Unexpected token {:?} after declaration", t));
                }
            }
        }

        Ok(TopDeclarations(top_declarations))
    }
}

/// Represents the foreign import/export annotations for a function type signature.
#[derive(Debug, PartialEq, Clone)]
pub enum IsForeign {
    /// The function is imported from the WASM library.
    LibImported,
    /// The function is imported from a foreign module.
    ForeignImported,
    /// The function is exported in the WASM module.
    Exported,
    /// The function is exported but the parameters and return value are unevaluated.
    UnevaluatedExported,
    /// The function is not foreign.
    NotForeign,
}

/// Represents a top-level declaration in a Haskell module.
#[derive(Debug)]
pub enum TopDeclaration {
    //TypeDecl(TypeDeclaration),
    //NewTypeDecl(NewTypeDeclaration),
    //FixityDecl(FixityDeclaration),
    /// Represents a data declaration in a Haskell module.
    DataDecl(DataDeclaration),
    /// Represents a type signature or function declaration in a Haskell module.
    TypeSig {
        /// name of the function
        name: String,
        /// type signature of the function
        ty: FunctionType,
        /// foreign import/export annotation
        is_foreign: IsForeign,
    },
    /// Represents a function declaration in a Haskell module.
    FunctionDecl(FunctionDeclaration),
}

impl TopDeclaration {
    /// Parse a top-level declaration from the input token iterator.
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        let token = next_token(input, true)?;
        match token {
            Token::ReservedIdent(ident) => match ident.as_str() {
                "data" => {
                    input.next(); // consume the 'data'
                    Ok(TopDeclaration::DataDecl(DataDeclaration::parse(input)?))
                }
                "foreign" => {
                    input.next(); // consume the 'foreign'
                    let next = next_token(input, false)?;
                    let error = Err(format!(
                        "Expected import or export after foreign but got: {:?}",
                        next
                    ));
                    let ident = if let Token::VariableIdent(ident) = next {
                        if ident != "export" {
                            return error;
                        }
                        ident
                    } else if let Token::ReservedIdent(ident) = next {
                        if ident != "import" {
                            return error;
                        }
                        ident
                    } else {
                        return error;
                    };

                    if ident != "import" && ident != "export" {
                        return Err(format!(
                            "Expected import or export after foreign but got: {}",
                            ident
                        ));
                    }

                    let next = next_token(input, false)?;
                    if let Token::VariableIdent(call_conv) = next {
                        if call_conv != "wasm" {
                            return Err(format!(
                                "Unsupported export call convention: {}",
                                call_conv
                            ));
                        }

                        let mut is_lib_import = false;
                        let mut is_unevaluated_export = false;

                        if let Token::String(str) = next_token(input, true)? {
                            input.next(); // consume the string
                            if ident == "import" && str == "lib" {
                                is_lib_import = true;
                            } else if ident == "export" && str == "unevaluated" {
                                is_unevaluated_export = true;
                            } else {
                                return Err(format!(
                                    "Unsupported annotation after foreign import/export call convention: {}",
                                    str
                                ));
                            }
                        }

                        let mut ty_sig = TopDeclaration::parse_type_sig_or_decl(input, true)?;
                        if let TopDeclaration::TypeSig {
                            ref mut is_foreign, ..
                        } = ty_sig
                        {
                            *is_foreign = if ident == "import" {
                                if is_lib_import {
                                    IsForeign::LibImported
                                } else {
                                    IsForeign::ForeignImported
                                }
                            } else if is_unevaluated_export {
                                IsForeign::UnevaluatedExported
                            } else {
                                IsForeign::Exported
                            };
                            return Ok(ty_sig);
                        }
                        unreachable!()
                    }

                    Err(format!(
                        "Expected export call convention after export but got: {:?}",
                        next
                    ))
                }
                "type" => {
                    unimplemented!()
                }
                "newtype" => {
                    unimplemented!()
                }
                _ => Err(format!("Unexpected keyword: {}", ident)),
            },
            _ => TopDeclaration::parse_type_sig_or_decl(input, false),
        }
    }

    /// Parse a type signature or function declaration from the input token iterator. Can be called
    /// after the `foreign` keyword or as a standalone function declaration.
    fn parse_type_sig_or_decl(input: &mut TokenIter, from_foreign: bool) -> Result<Self, String> {
        let func_name = match next_token(input, false)? {
            // TODO: support (&*) as variables
            Token::Special('(') => {
                if let Token::VariableSym(sym) = next_token(input, false)? {
                    if let Token::Special(')') = next_token(input, false)? {
                        sym
                    } else {
                        return Err("Expected ')' after variable symbol".to_string());
                    }
                } else {
                    return Err(
                        "Expected variable symbol after '('. Got something else".to_string()
                    );
                }
            }
            Token::VariableIdent(ident) => ident,
            t => return Err(format!("Unexpected token for top declaration: {:?}", t)),
        };

        match next_token(input, true)? {
            Token::ReservedOperator(op) if op == "::" => {
                input.next(); // consume the '::'
                Ok(TopDeclaration::TypeSig {
                    name: func_name,
                    ty: FunctionType::parse(input)?,
                    is_foreign: IsForeign::NotForeign,
                })
            }
            _ if !from_foreign => Ok(TopDeclaration::FunctionDecl(FunctionDeclaration::parse(
                func_name, input,
            )?)),
            _ => Err("Expected type signature after foreign declaration".to_string()),
        }
    }
}

/// Represents a type that can be a function type (e.g. `Int -> Int`, a function that takes an `Int` and returns an `Int`) or a simple type (e.g. `Int`).
#[derive(Debug, Clone)]
pub struct FunctionType(pub Vec<Type>);

impl FunctionType {
    /// Parse a function type signature from the input token iterator.
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        let mut types = vec![];
        loop {
            types.push(Type::parse(input)?);
            match next_token(input, true)? {
                Token::ReservedOperator(op) if op == "->" => {
                    input.next(); // consume the '->'
                    continue;
                }
                _ => {
                    break;
                }
            }
        }

        Ok(FunctionType(types))
    }
}

/// Represents a type application. It can be a simple type (e.g. `Int`) or a type constructor (e.g. `Maybe Int`).
#[derive(Debug, Clone)]
pub struct Type(pub Vec<TypeApplicationElement>);

impl Type {
    /// Parse a type signature from the input token iterator.
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        let mut types = vec![];
        loop {
            types.push(TypeApplicationElement::parse(input)?);
            match next_token(input, true)? {
                // check if the type continues of if this is the end of the type signature (doesn't
                // support operator type constructors)
                Token::ReservedOperator(op) if op == "->" => {
                    break;
                }
                Token::Special(op) if op == ';' || op == ')' || op == ',' => {
                    break;
                }
                _ => {}
            }
        }

        Ok(Type(types))
    }
}

/// Represents a type application element.
#[derive(Debug, Clone)]
pub enum TypeApplicationElement {
    /// Represents a unit type.
    Unit,
    //ListConstructor,
    /// Represents an unapplied tuple constructor.
    TupleConstructor(i32),
    //FunctionConstructor,
    //ListType(Box<FunctionType>),
    /// Represents a tuple type.
    TupleType(Vec<FunctionType>),
    /// Represents a type variable.
    TypeVariable(String),
    /// Represents a parenthesized type (e.g. if an element of the type signature is a function type).
    ParenthesizedType(Box<FunctionType>),
    /// Represents a type constructor for a custom type (e.g. `Maybe`).
    TypeConstructor(String),
}

impl TypeApplicationElement {
    /// Parse a type application element from the input token iterator.
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        match next_token(input, false)? {
            Token::ConstructorIdent(ident) => Ok(TypeApplicationElement::TypeConstructor(ident)),
            Token::VariableIdent(ident) => Ok(TypeApplicationElement::TypeVariable(ident)),
            Token::Special('(') => {
                match next_token(input, true)? {
                    Token::Special(')') => {
                        input.next(); // consume the ')'
                        return Ok(TypeApplicationElement::Unit);
                    }
                    Token::Special(',') => {
                        input.next(); // consume the ','
                        let mut count = 2;
                        loop {
                            match next_token(input, false)? {
                                Token::Special(',') => {
                                    count += 1;
                                    continue;
                                }
                                Token::Special(')') => {
                                    return Ok(TypeApplicationElement::TupleConstructor(count));
                                }
                                t => Err(format!(
                                    "Expected ',' or ')' after '(' in tuple type constructor, got {:?}",
                                    t,
                                ))?,
                            }
                        }
                    }
                    Token::ReservedOperator(op) if op == "->" => {
                        unimplemented!("Function type application")
                    }
                    _ => {}
                };

                let mut types = vec![];
                loop {
                    types.push(FunctionType::parse(input)?);
                    match next_token(input, false)? {
                        Token::Special(',') => {}
                        Token::Special(')') => {
                            if types.len() == 1 {
                                return Ok(TypeApplicationElement::ParenthesizedType(Box::new(
                                    types.pop().unwrap(),
                                )));
                            } else {
                                return Ok(TypeApplicationElement::TupleType(types));
                            }
                        }
                        _ => Err(format!(
                            "Expected ',' or ')' after type in parenthesized type, got {:?}",
                            next_token(input, true)?
                        ))?,
                    }
                }
            }
            Token::Special('[') => todo!(),
            t => todo!("Type parsing for lists and type variables: {:?}", t),
        }
    }
}

/// Represents a data declaration in a Haskell module.
#[derive(Debug)]
pub struct DataDeclaration {
    /// The name of the type constructor for the data declaration.
    pub ty_constructor: String,
    /// The type variables for the data declaration (can be empty if the data declaration is a simple type).
    pub ty_vars: Vec<String>,
    /// The data constructors for the data declaration.
    pub data_constructors: Vec<DataConstructor>,
}

impl DataDeclaration {
    /// Parse a data declaration from the input token iterator.
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        let name = match next_token(input, false)? {
            Token::ConstructorIdent(ident) => ident,
            t => return Err(format!("Expected constructor identifier, got {:?}", t)),
        };

        // parse type variables
        let mut ty_vars = vec![];
        loop {
            match next_token(input, true)? {
                Token::VariableIdent(ident) => {
                    input.next(); // consume the variable
                    ty_vars.push(ident);
                }
                Token::ReservedOperator(op) if op == "=" => {
                    break;
                }
                Token::Special(';') => {
                    break;
                }
                _ => {
                    break;
                }
            }
        }

        if matches!(next_token(input, true)?, Token::ReservedOperator(op) if op == "=") {
            input.next(); // consume the '='
        } else {
            return Ok(DataDeclaration {
                ty_constructor: name,
                ty_vars,
                data_constructors: vec![],
            });
        }

        let mut constructors = vec![];
        loop {
            constructors.push(DataConstructor::parse(input)?);
            match next_token(input, true)? {
                Token::ReservedOperator(op) if op == "|" => {
                    input.next(); // consume the '|'
                    continue;
                }
                _ => {
                    break;
                }
            }
        }

        Ok(DataDeclaration {
            ty_constructor: name,
            ty_vars,
            data_constructors: constructors,
        })
    }
}

/// Represents a data constructor in a Haskell module.
#[derive(Debug)]
pub struct DataConstructor {
    /// The name of the data constructor.
    pub name: String,
    /// The fields of the data constructor.
    pub fields: Vec<TypeApplicationElement>,
}

impl DataConstructor {
    /// Parse a data constructor from the input token iterator.
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        let name = match next_token(input, false)? {
            Token::ConstructorIdent(ident) => ident,
            t => return Err(format!("Expected constructor identifier, got {:?}", t)),
        };

        let mut fields = vec![];
        loop {
            match next_token(input, true)? {
                Token::ReservedOperator(op) if op == "|" => {
                    break;
                }
                Token::Special(';') => {
                    break;
                }
                _ => {}
            }
            fields.push(TypeApplicationElement::parse(input)?);
        }

        Ok(DataConstructor { name, fields })
    }
}

/// Represents a function declaration in a Haskell module.
#[derive(Debug)]
pub struct FunctionDeclaration {
    /// The name of the function.
    pub name: String,
    /// The pattern matching for the function left-hand side.
    pub lhs: Vec<FunctionParameterPattern>,
    /// The right-hand side expression for the function.
    pub rhs: Expression,
}

impl FunctionDeclaration {
    /// Parse a function declaration from the input token iterator.
    fn parse(name: String, input: &mut TokenIter) -> Result<Self, String> {
        let mut lhs = vec![];
        let next = next_token(input, true)?;
        if matches!(next, Token::ReservedOperator(op) if op == "=") {
            input.next(); // consume the '='
            let rhs = Expression::parse(input)?;
            return Ok(FunctionDeclaration { name, lhs, rhs });
        }

        loop {
            lhs.push(FunctionParameterPattern::parse(input)?);
            match next_token(input, true)? {
                Token::ReservedOperator(op) if op == "=" => {
                    input.next(); // consume the '='
                    break;
                }
                _ => continue,
            }
        }

        Ok(FunctionDeclaration {
            name,
            lhs,
            rhs: Expression::parse(input)?,
        })
    }
}

/// Represents a pattern for a function parameter in a function declaration.
#[derive(Debug, Clone)]
pub enum FunctionParameterPattern {
    /// Represents a variable pattern. It can be an `as` pattern (e.g. `x@p`) or a simple variable
    AsPattern(String, Option<Box<FunctionParameterPattern>>),
    /// Represents a constructor pattern. In this case its matching against a data constructor
    /// without any fields.
    ConstructorPattern(String),
    /// Represents a unit pattern. It matches against the unit type `()`.
    UnitPattern,
    /// Represents an empty tuple pattern. It matches against a tuple with no elements.
    EmptyTuplePattern(i32),
    //EmptyListPattern,
    /// Represents a string literal pattern.
    StringLiteral(String),
    /// Represents an integer literal pattern.
    IntegerLiteral(i32),
    /// Represents a character literal pattern.
    CharLiteral(char),
    /// Represents a wildcard pattern. It matches against any value.
    Wildcard,
    /// Represents a parenthesized pattern. It is required for more complex patterns.
    ParenthesizedPattern(Box<Pattern>),
    /// Represents a tuple pattern. It matches against a tuple with one or more elements.
    TuplePattern(Vec<Pattern>),
    //ListPattern(Vec<Pattern>),
}

impl FunctionParameterPattern {
    /// Parse a function parameter pattern from the input token iterator.
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        use FunctionParameterPattern::*;

        match next_token(input, false)? {
            Token::VariableIdent(ident) => {
                match next_token(input, true)? {
                    Token::ReservedOperator(op) if op == "@" => {
                        input.next(); // consume the '@'
                        Ok(AsPattern(
                            ident,
                            Some(Box::new(FunctionParameterPattern::parse(input)?)),
                        ))
                    }
                    _ => Ok(AsPattern(ident, None)),
                }
            }
            Token::ConstructorIdent(ident) => Ok(ConstructorPattern(ident)),
            Token::Special('(') => {
                match next_token(input, true)? {
                    Token::Special(')') => {
                        input.next(); // consume the ')'
                        return Ok(UnitPattern);
                    }
                    Token::Special(',') => {
                        input.next(); // consume the ','
                        let mut count = 2;
                        loop {
                            match next_token(input, false)? {
                                Token::Special(',') => {
                                    count += 1;
                                    continue;
                                }
                                Token::Special(')') => {
                                    return Ok(EmptyTuplePattern(count));
                                }
                                t => Err(format!(
                                    "Expected ',' or ')' after '(' in tuple pattern, got {:?}",
                                    t,
                                ))?,
                            }
                        }
                    }
                    _ => {}
                }

                let mut patterns = vec![];
                loop {
                    patterns.push(Pattern::parse(input)?);
                    match next_token(input, false)? {
                        Token::Special(',') => {}
                        Token::Special(')') => {
                            if patterns.len() == 1 {
                                return Ok(ParenthesizedPattern(Box::new(patterns.pop().unwrap())));
                            } else {
                                return Ok(TuplePattern(patterns));
                            }
                        }
                        t => Err(format!(
                            "Expected ',' or ')' after pattern in parenthesized pattern, got {:?}",
                            t,
                        ))?,
                    }
                }
            }
            Token::Special('[') => todo!(),
            Token::Integer(i) => Ok(IntegerLiteral(i)),
            Token::Char(c) => Ok(CharLiteral(c)),
            Token::String(s) => Ok(StringLiteral(s)),
            Token::ReservedIdent(ident) if ident == "_" => Ok(Wildcard),
            t => Err(format!("Expected variable identifier, got {:?}", t)),
        }
    }
}

/// Represents a more general pattern for negated integer literals and data constructors with fields.
#[derive(Debug, Clone)]
pub enum Pattern {
    /// Represents a function parameter pattern.
    FunctionParameterPattern(FunctionParameterPattern),
    /// Represents a constructor pattern. It matches against a data constructor with fields.
    ConstructorPattern(String, Vec<FunctionParameterPattern>),
    /// Represents a negated integer literal pattern.
    NegatedIntegerLiteral(i32),
    //InfixConstructorPattern(String, Box<Pattern>, Box<Pattern>),
}

impl Pattern {
    /// Parse a pattern from the input token iterator.
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        match next_token(input, true)? {
            Token::ConstructorIdent(ident) => {
                input.next(); // consume the constructor

                if let Token::Special(')') = next_token(input, true)? {
                    return Ok(Pattern::FunctionParameterPattern(
                        FunctionParameterPattern::ConstructorPattern(ident),
                    ));
                }

                let mut patterns = vec![];
                loop {
                    if matches!(next_token(input, true)?, Token::Special(')')) {
                        break;
                    }

                    let elem = FunctionParameterPattern::parse(input)?;
                    patterns.push(elem);
                }

                Ok(Pattern::ConstructorPattern(ident, patterns))
            }
            Token::ReservedOperator(op) if op == "-" => {
                input.next(); // consume the '-'
                match next_token(input, false)? {
                    Token::Integer(i) => Ok(Pattern::NegatedIntegerLiteral(i)),
                    t => Err(format!("Expected integer literal, got {:?}", t)),
                }
            }
            _ => {
                let elem = FunctionParameterPattern::parse(input)?;
                Ok(Pattern::FunctionParameterPattern(elem))
            }
        }
    }
}

/// Represents a top level expression in a Haskell module.
#[derive(Debug)]
pub enum Expression {
    /// Represents an infixed application of an operator to two expressions (an operator can be a
    /// variable identifier with backticks: ``a `op` b`` or variable symbols: `a + b`).
    InfixedApplication(Box<LeftHandSideExpression>, String, Box<Expression>),
    /// Represents a negated expression (e.g. `-a`).
    NegatedExpr(Box<Expression>),
    /// Represents a left-hand side expression.
    LeftHandSideExpression(Box<LeftHandSideExpression>),
}

impl Expression {
    /// Parse an expression from the input token iterator.
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        match next_token(input, true)? {
            Token::VariableSym(sym) if sym == "-" => {
                input.next(); // consume the '-'
                Ok(Expression::NegatedExpr(Box::new(Expression::parse(input)?)))
            }
            _ => {
                let lhs = Box::new(LeftHandSideExpression::parse(input)?);

                if input.peek().is_none() {
                    return Ok(Expression::LeftHandSideExpression(lhs));
                }

                let op = match next_token(input, true)? {
                    Token::VariableSym(op) | Token::ConstructorSym(op) => {
                        input.next(); // consume the operator
                        op
                    }
                    Token::ReservedOperator(op) if op == ":" => {
                        input.next(); // consume the operator
                        op
                    }
                    Token::Special('`') => {
                        input.next(); // consume the '`'
                        match next_token(input, false)? {
                            Token::VariableIdent(op) => match next_token(input, false)? {
                                Token::Special('`') => op,
                                t => {
                                    return Err(format!(
                                        "Expected variable identifier, got {:?}",
                                        t
                                    ))
                                }
                            },
                            t => return Err(format!("Expected variable identifier, got {:?}", t)),
                        }
                    }
                    _ => return Ok(Expression::LeftHandSideExpression(lhs)),
                };

                Ok(Expression::InfixedApplication(
                    lhs,
                    op,
                    Box::new(Expression::parse(input)?),
                ))
            }
        }
    }
}

/// Represents a left-hand side expression in a Haskell module (in this case left-hand side means
/// either the left-hand side of a infix expression or just an expression that can't be represented
/// in the [`Expression`] enum).
#[derive(Debug)]
pub enum LeftHandSideExpression {
    /// Represents a function application.
    FunctionApplication(Vec<FunctionParameterExpression>),
    //LambdaExpr(Vec<Pattern>, Box<Expression>),
    //LetExpr(Vec<Declarations>, Box<Expression>), // make a group of function decls and type sigs under
    //tobdecls
    //IfExpr(Box<Expression>, Box<Expression>, Box<Expression>),
    //CaseExpr(Box<Expression>, Vec<CaseAlternative>),
}

impl LeftHandSideExpression {
    /// Parse a left-hand side expression from the input token iterator.
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        match next_token(input, true)? {
            Token::ReservedIdent(ident) => match ident.as_str() {
                "let" => {
                    input.next(); // consume the 'let'
                    todo!()
                }
                "if" => {
                    input.next(); // consume the 'if'
                    todo!()
                }
                "case" => {
                    input.next(); // consume the 'case'
                    todo!()
                }
                _ => Err(format!("Unexpected token for expression: {}", ident)),
            },
            Token::ReservedOperator(op) if op == "\\" => unimplemented!("Lambda expressions"),
            _ => {
                let mut params = vec![];
                loop {
                    params.push(FunctionParameterExpression::parse(input)?);
                    if input.peek().is_none() {
                        break;
                    }

                    let next = next_token(input, true)?;
                    if let Token::Special(';') = next {
                        break;
                    }

                    match next {
                        Token::Special('(')
                        | Token::Special('[')
                        | Token::VariableIdent(_)
                        | Token::ConstructorIdent(_)
                        | Token::String(_)
                        | Token::Integer(_)
                        | Token::Char(_) => continue,
                        _ => break,
                    }
                }
                Ok(LeftHandSideExpression::FunctionApplication(params))
            }
        }
    }
}

/// Represents a parameter of a function application in a Haskell module.
#[derive(Debug)]
pub enum FunctionParameterExpression {
    /// Represents a string literal.
    StringLiteral(String),
    /// Represents an integer literal.
    IntegerLiteral(i32),
    /// Represents a character literal.
    CharLiteral(char),
    /// Represents a variable.
    Variable(String),
    /// Represents a constructor.
    Constructor(String),
    //EmptyList,
    /// Represents an empty tuple.
    EmptyTuple(i32),
    /// Represents a unit value.
    Unit,
    /// Represents a parenthesized expression.
    ParenthesizedExpr(Box<Expression>),
    /// Represents a tuple expression.
    TupleExpr(Vec<Expression>),
    //ListExpr(Vec<Expression>),
    //ArithmeticSequence(Box<Expression>, Option<Box<Expression>>, Option<Box<Expression>>),
    //ListComprehension(Box<Expression>, ...),
    //LeftSection(String, Box<Expression>),
    //RightSection(Box<Expression>, String),
}

impl FunctionParameterExpression {
    /// Parse a function parameter expression from the input token iterator.
    fn parse(input: &mut TokenIter) -> Result<Self, String> {
        match next_token(input, false)? {
            Token::VariableIdent(ident) => Ok(FunctionParameterExpression::Variable(ident)),
            Token::ConstructorIdent(ident) => Ok(FunctionParameterExpression::Constructor(ident)),
            Token::Special('(') => match next_token(input, true)? {
                Token::Special(')') => {
                    input.next(); // consume the ')'
                    Ok(FunctionParameterExpression::Unit)
                }
                Token::Special(',') => {
                    input.next(); // consume the ','
                    let mut count = 2;
                    loop {
                        match next_token(input, false)? {
                            Token::Special(',') => {
                                count += 1;
                                continue;
                            }
                            Token::Special(')') => {
                                return Ok(FunctionParameterExpression::EmptyTuple(count));
                            }
                            t => Err(format!(
                                "Expected ',' or ')' after '(' in tuple expression, got {:?}",
                                t,
                            ))?,
                        }
                    }
                }
                Token::VariableSym(op) if op != "-" => {
                    input.next(); // consume the operator
                    match next_token(input, false)? {
                        Token::Special(')') => Ok(FunctionParameterExpression::Variable(op)),
                        t => Err(format!("Expected ')', got {:?}", t)),
                    }
                }
                _ => {
                    let mut exprs = vec![];
                    loop {
                        exprs.push(Expression::parse(input)?);
                        match next_token(input, false)? {
                            Token::Special(',') => {}
                            Token::Special(')') => {
                                if exprs.len() == 1 {
                                    return Ok(FunctionParameterExpression::ParenthesizedExpr(
                                        Box::new(exprs.pop().unwrap()),
                                    ));
                                } else {
                                    return Ok(FunctionParameterExpression::TupleExpr(exprs));
                                }
                            }
                            t => Err(format!(
                                "Expected ',' or ')' after expression in parenthesized expression, got {:?}",
                                t,
                            ))?,
                        }
                    }
                }
            },
            Token::Special('[') => {
                todo!()
            }
            Token::String(s) => Ok(FunctionParameterExpression::StringLiteral(s)),
            Token::Integer(i) => Ok(FunctionParameterExpression::IntegerLiteral(i)),
            Token::Char(c) => Ok(FunctionParameterExpression::CharLiteral(c)),
            t => Err(format!("Expected variable identifier, got {:?}", t)),
        }
    }
}

/// Parse the input string and return the list of top-level declarations or an error message.
///
/// Prints the tokens and the AST if the `debug_lexer` and `debug_ast` flags are set to `true`.
pub fn parse(input: &str, debug_lexer: bool, debug_ast: bool) -> Result<TopDeclarations, String> {
    if debug_lexer {
        println!("Tokens: {:#?}", Token::lexer(input).collect::<Vec<_>>());
    }

    let mut tokens = Token::lexer(input).peekable();

    let ast = TopDeclarations::parse(&mut tokens)?;

    if debug_ast {
        println!("{:#?}", ast);
    }

    Ok(ast)
}
