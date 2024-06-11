use logos::{Lexer, Logos};

#[derive(Logos, Debug, PartialEq)]
#[logos(skip r"\s+")]
pub enum Token {
    // any string that starts with a lowercase letter or _ and is followed by any word character (a-z, A-Z, 0-9, _) or '
    #[regex(r"[[[:lower:]]_][[:word:]]*", |lex| lex.slice().to_owned())]
    VariableIdent(String),

    // any string that starts with an uppercase letter and is followed by any word character (a-z, A-Z, 0-9, _) or '
    #[regex(r"[[:upper:]][[[:word:]]']*", |lex| lex.slice().to_owned())]
    ConstructorIdent(String),

    #[regex(r"case|class|data|default|deriving|do|else|foreign|if|import|in|infix|infixl|infixr|instance|let|module|
            newtype|of|then|type|where|_", |lex| lex.slice().to_owned(), priority = 100)]
    ReservedIdent(String),

    #[regex(r"\.\.|:|::|=|\\|\||<-|->|@|~|=>", |lex| lex.slice().to_owned(), priority = 100)]
    ReservedOperator(String),

    // any string of symbol characters (punctuation, math, etc.) that does not start with a colon
    #[regex(r#"[\pS\pP--[_"'\(),;\[\]`\{}:]][\pS\pP--[_"'\(),;\[\]`\{}]]*"#, |lex| lex.slice().to_owned(), priority = 50)]
    VariableSym(String),

    // any string that starts with a colon and is followed by any symbol character (punctuation, math, etc.)
    #[regex(r#":[\pS\pP--[_"'\(),;\[\]`\{}]]*"#, |lex| lex.slice().to_owned(), priority = 50)]
    ConstructorSym(String),

    #[regex(r"[\(),;\[\]`\{}]", |lex| lex.slice().chars().next().unwrap(), priority = 200)]
    Special(char),

    #[regex(r"\d+", |lex| lex.slice().parse::<i64>().unwrap())]
    Number(i64),
    
    #[regex(r#""[^"]*""#, |lex| lex.slice()[1..lex.slice().len()-1].to_owned())]
    String(String),
}
