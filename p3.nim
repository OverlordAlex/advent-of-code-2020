import strutils

let slope = readFile("in.3").splitLines()

const 
    rights = [1, 3, 5, 7, 1]
    downs = [1, 1, 1, 1, 2]

var
    totalTrees = 1

for i in 0..4:
    var 
        right = rights[i]
        down = downs[i]
        row = 0
        col = 0
        trees = 0

    while row < slope.len:
        var chr = slope[row][col]

        if chr == '#':
            trees += 1

        row += down

        if row >= slope.len - 1:
            break

        col += right
        col = col mod slope[row].len

    totalTrees *= trees

echo totalTrees
