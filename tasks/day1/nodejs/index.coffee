fs = require 'fs'

level = 0
basemant = 0

file_path = process.argv[2]
content = fs.readFileSync file_path, 'utf8'

calc = (sym, index) ->
    if ['(', ')'].indexOf(sym) != -1
        if sym == '(' then level++ else level--
        basemant = index + 1 if basemant == 0 and level < 0

calc sym, index for sym, index in content

console.log 'Level: ' + level
console.log 'Basemant: ' + basemant