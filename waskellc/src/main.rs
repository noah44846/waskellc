use std::fs;

fn main() {
    let file_contents = fs::read_to_string("examples/x_square.wsk").unwrap();

    waskellc::parse(file_contents);
}
