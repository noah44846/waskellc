use std::fs;

use waskellc::parser;

fn main() {
    let file_contents = fs::read_to_string("examples/x_square.wsk").unwrap();

    parser::parse(&file_contents);

    waskellc::code_gen::generate();
}
