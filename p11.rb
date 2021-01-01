grid = File.read("in.11").split

neighbours = Array.new(grid.length) { Array.new(grid[0].length, 0) }

def updateNeighbours(r, c, neighbours, val)
    for i in -1..1
        if r + i < 0 then
            next
        elsif r + i >= neighbours.length then
            next
        end
 
        for j in -1..1
            if i == 0 and j == 0 then
                next
            elsif c + j < 0 then
                next
            elsif c + j >= neighbours[r + i].length then
                next
            end
            neighbours[r + i][c + j] += val
        end
    end
end

def copy(old, new)
    old.each{|e| new << e.dup }
end

def findN(grid, r, c)
    nN = 0

    # left
    for i in 1..c
        if grid[r][c - i] == 'L'
            break
        end
        if grid[r][c - i] == '#'
            nN += 1
            break
        end
    end
    # right
    for i in 1..(grid[r].length - 1 - c)
        if grid[r][c + i] == 'L'
            break
        end
        if grid[r][c + i] == '#'
            nN += 1
            break
        end
    end   
    # up 
    for i in 1..r
        if grid[r - i][c] == 'L'
            break
        end
        if grid[r - i][c] == '#'
            nN += 1
            break
        end
    end
    # down
    for i in 1..(grid.length - 1 - r)
        if grid[r + i][c] == 'L'
            break
        end
        if grid[r + i][c] == '#'
            nN += 1
            break
        end
    end   
    # left up
    for i in 1..([c, r].min)
        if grid[r - i][c - i] == 'L'
            break
        end
        if grid[r - i][c - i] == '#'
            nN += 1
            break
        end
    end
    # left down
    for i in 1..([c, grid.length - 1 - r].min)
        if grid[r + i][c - i] == 'L'
            break
        end
        if grid[r + i][c - i] == '#'
            nN += 1
            break
        end
    end
    # right up
    for i in 1..([r, grid[r].length - 1 - c].min)
        if grid[r - i][c + i] == 'L'
            break
        end
        if grid[r - i][c + i] == '#'
            nN += 1
            break
        end
    end
    # right down
    for i in 1..([grid.length - 1 - r, grid[r].length - 1 - c].min)
        if grid[r + i][c + i] == 'L'
            break
        end
        if grid[r + i][c + i] == '#'
            nN += 1
            break
        end
    end

    #puts "#{nN} #{r} #{c}"
    return nN
end

def doIter(grid, neighbours)
    newGrid = []
    copy(grid, newGrid)
    newNeighbours = []
    copy(neighbours, newNeighbours)
    changed = false

    grid.each_with_index do |line, index|
        line.each_char.with_index do |char, jndex|
            if char == '.' then
                next
            end

            if char == 'L' and findN(grid, index, jndex) == 0 then
                newGrid[index][jndex] = '#'
                changed = true
            elsif char == '#' and findN(grid, index, jndex) >= 5 then
                newGrid[index][jndex] = 'L'
                changed = true
            end

            # part 1
            #puts "#{char} at #{index}, #{jndex} -> #{neighbours[index][jndex]}"
            #if char == 'L' and neighbours[index][jndex] == 0 then
            #    newGrid[index][jndex] = '#'
            #    updateNeighbours(index, jndex, newNeighbours, 1)
            #    changed = true
            #elsif char == '#' and neighbours[index][jndex] >= 4 then
            #    newGrid[index][jndex] = 'L'
            #    updateNeighbours(index, jndex, newNeighbours, -1)
            #    changed = true
            #end
        end
    end

    #puts newGrid
    #puts "---------------------------"
    return newGrid, newNeighbours, changed
end

changed = true
while changed
    grid, neighbours, changed = doIter(grid, neighbours)
end

occupied = grid.reduce(0) { |total, nxt| total += nxt.count '#'  }
#puts grid
puts occupied
