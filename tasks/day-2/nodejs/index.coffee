fs = require 'fs'
present = require './present'

total_square_feets = ribon_length = 0

file_path = process.argv[2]

for line in fs.readFileSync(file_path).toString().split "\n"
    [length, width, height] = line.split('x').map((item, i) -> parseInt(item))
    p = new present.Present(length, width, height)
    total_square_feets += p.getSquare()
    ribon_length += p.getRibonLength()

console.log 'Total square feets: ' + total_square_feets
console.log 'Ribon length: ' + ribon_length