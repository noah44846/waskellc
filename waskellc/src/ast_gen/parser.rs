// SPDX-License-Identifier: MIT

use logos::Logos;

use crate::ast_gen::lexer::{Token, TokenIter};

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

#[derive(Debug)]
pub struct TopDeclarations(pub Vec<TopDeclaration>);

impl TopDeclarations {
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

#[derive(Debug)]
pub enum TopDeclaration {
    //TypeDecl(TypeDeclaration),
    //NewTypeDecl(NewTypeDeclaration),
    //FixityDecl(FixityDeclaration),
    DataDecl(DataDeclaration),
    TypeSig {
        name: String,
        ty: FunctionType,
        is_exported: bool,
        is_imported: bool,
    },
    FunctionDecl(FunctionDeclaration),
}

impl TopDeclaration {
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

                    let next = next_token(input, false)?;
                    if ident != "import" && ident != "export" {
                        return Err(format!(
                            "Expected import or export after foreign but got: {}",
                            ident
                        ));
                    }

                    if let Token::VariableIdent(call_conv) = next {
                        if call_conv != "wasm" {
                            return Err(format!(
                                "Unsupported export call convention: {}",
                                call_conv
                            ));
                        }

                        let mut ty_sig = TopDeclaration::parse_type_sig_or_decl(input, true)?;
                        if let TopDeclaration::TypeSig {
                            ref mut is_exported,
                            ref mut is_imported,
                            ..
                        } = ty_sig
                        {
                            *is_exported = ident == "export";
                            *is_imported = ident == "import";
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
                    is_exported: false,
                    is_imported: false,
                })
            }
            _ if !from_foreign => Ok(TopDeclaration::FunctionDecl(FunctionDeclaration::parse(
                func_name, input,
            )?)),
            _ => Err("Expected type signature after foreign declaration".to_string()),
        }
    }
}

#[derive(Debug, Clone)]
pub struct FunctionType(pub Vec<Type>);

impl FunctionType {
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

#[derive(Debug, Clone)]
pub struct Type(pub Vec<TypeApplicationElement>);

impl Type {
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

#[derive(Debug, Clone)]
pub enum TypeApplicationElement {
    Unit,
    //ListConstructor,
    TupleConstructor(i32),
    //FunctionConstructor,
    //ListType(Box<FunctionType>),
    TupleType(Vec<FunctionType>),
    TypeVariable(String),
    ParenthesizedType(Box<FunctionType>),
    TypeConstructor(String),
}

impl TypeApplicationElement {
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
            Token::Special('[') => {
                todo!();
                //input.next();  consume the '['

                //if let Token::Special(']') = next_token(input, true)? {
                //input.next();  consume the ']'
                //return Ok(TypeApplicationElement::ListConstructor);
                //}

                //let elem = Box::new(FunctionType::parse(input)?);
                //let next = next_token(input, false)?;
                //if matches!(next, Token::Special(']')) {
                //input.next();  consume the ']'
                //return Ok(TypeApplicationElement::ListType(elem));
                //} else {
                //return Err(format!(
                //"Expected ']' after type in list type, got {:?}",
                //next
                //));
                //}
            }
            t => todo!("Type parsing for lists and type variables: {:?}", t),
        }
    }
}

#[derive(Debug)]
pub struct DataDeclaration {
    pub ty_constructor: String,
    pub ty_vars: Vec<String>,
    pub data_constructors: Vec<DataConstructor>,
}

impl DataDeclaration {
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

#[derive(Debug)]
pub struct DataConstructor {
    pub name: String,
    pub fields: Vec<TypeApplicationElement>,
}

impl DataConstructor {
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

#[derive(Debug)]
pub struct FunctionDeclaration {
    // TODO: operator definitions
    // TODO: where clauses
    // TODO: guards
    pub name: String,
    pub lhs: Vec<FunctionParameterPattern>,
    pub rhs: Expression,
    //pub guards: Vec<Guard>,
}

impl FunctionDeclaration {
    // TODO: definition of operators would be here: parse "pat varop pat"
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

#[derive(Debug, Clone)]
pub enum FunctionParameterPattern {
    AsPattern(String, Option<Box<FunctionParameterPattern>>),
    ConstructorPattern(String),
    UnitPattern,
    EmptyTuplePattern(i32),
    //EmptyListPattern,
    StringLiteral(String),
    IntegerLiteral(i32),
    CharLiteral(char),
    Wildcard,
    ParenthesizedPattern(Box<Pattern>),
    TuplePattern(Vec<Pattern>),
    //ListPattern(Vec<Pattern>),
}

impl FunctionParameterPattern {
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
            // TODO: could be empty list or empty tuple
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
            Token::Special('[') => {
                todo!();
                //input.next(); // consume the '['

                //if let Token::Special(']') = next_token(input, true)? {
                //input.next(); // consume the ']'
                //return Ok(EmptyListPattern);
                //}

                //let mut types = vec![];
                //loop {
                //types.push(Pattern::parse(input)?);
                //match next_token(input, false)? {
                //Token::Special(',') => {}
                //Token::Special(']') => {
                //return Ok(FunctionParameterPattern::ListPattern(types));
                //}
                //t => Err(format!(
                //"Expected ',' or ']' after pattern in list pattern, got {:?}",
                //t,
                //))?,
                //}
                //}
            }
            Token::Integer(i) => Ok(IntegerLiteral(i)),
            Token::Char(c) => Ok(CharLiteral(c)),
            Token::String(s) => Ok(StringLiteral(s)),
            Token::ReservedIdent(ident) if ident == "_" => Ok(Wildcard),
            t => Err(format!("Expected variable identifier, got {:?}", t)),
        }
    }
}

#[derive(Debug, Clone)]
pub enum Pattern {
    FunctionParameterPattern(FunctionParameterPattern),
    ConstructorPattern(String, Vec<FunctionParameterPattern>),
    NegatedIntegerLiteral(i32),
    //InfixConstructorPattern(String, Box<Pattern>, Box<Pattern>),
}

impl Pattern {
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

#[derive(Debug)]
pub enum Expression {
    InfixedApplication(Box<LeftHandSideExpression>, String, Box<Expression>),
    NegatedExpr(Box<Expression>),
    LeftHandSideExpression(Box<LeftHandSideExpression>),
}

impl Expression {
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

#[derive(Debug)]
pub enum LeftHandSideExpression {
    FunctionApplication(Vec<FunctionParameterExpression>),
    //LambdaExpr(Vec<Pattern>, Box<Expression>),
    //LetExpr(Vec<Declarations>, Box<Expression>), // make a group of function decls and type sigs under
    //tobdecls
    //IfExpr(Box<Expression>, Box<Expression>, Box<Expression>),
    //CaseExpr(Box<Expression>, Vec<CaseAlternative>),
}

impl LeftHandSideExpression {
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

#[derive(Debug)]
pub enum FunctionParameterExpression {
    StringLiteral(String),
    IntegerLiteral(i32),
    CharLiteral(char),
    Variable(String),
    Constructor(String),
    //EmptyList,
    EmptyTuple(i32),
    Unit,
    ParenthesizedExpr(Box<Expression>),
    TupleExpr(Vec<Expression>),
    //ListExpr(Vec<Expression>),
    //ArithmeticSequence(Box<Expression>, Option<Box<Expression>>, Option<Box<Expression>>),
    //ListComprehension(Box<Expression>, ...),
    //LeftSection(String, Box<Expression>),
    //RightSection(Box<Expression>, String),
}

impl FunctionParameterExpression {
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
