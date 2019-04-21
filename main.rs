use std::fs::File;
use std::io::{BufReader, BufRead};
use std::io::Error;

fn main() -> Result<(), Error> {
    let mut lines: Vec<String> = vec![];

    let file = File::open("tmp/logs.log")?;
    let mut buffered = BufReader::new(file);
    let mut line = String::new();

    while let Ok(size) = buffered.read_line(&mut line) {
        if size == 0 { break }

        if let Some(position) = line.find("OK db=") {
            lines.push(line[position..].into())
        }

        line.clear()
    }

    println!("{:?}", lines[40]);

    Ok(())
}
