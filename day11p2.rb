require_relative 'funs'

data = load_data(11).split.map(&:chars)

def check(grid, i, j, xd, yd)
    x = i+xd
    y = j+yd
    until x >= grid.length || x < 0 || y >= grid[0].length || y < 0 || grid[x][y] != '.'
        x += xd
        y += yd
    end
    if x >= grid.length || x < 0 || y >= grid[0].length || y < 0
        false
    else
        grid[x][y] == '#'
    end
end

def extend(grid)
    nxt = Array.new(grid.length) { Array.new(grid[0].length, '.')}
    (0...grid.length).each do |i|
        (0...grid[0].length).each do |j|
            occ = 0
            (-1..1).each do |k|
                (-1..1).each do |l|
                    next if k == 0 && l == 0
                    occ += 1 if check(grid, i, j, k, l)
                end
            end

            nxt[i][j] = if grid[i][j] == '#'
                            occ >= 5 ? 'L' : '#'
                        elsif grid[i][j] == 'L'
                            occ == 0 ? '#' : 'L'
                        else
                            grid[i][j]
                        end
        end
    end
    nxt
end

pre = [[]]
until pre == data
    pre = data
    data = extend(data)
    # puts "------"
    # puts data.map(&:join).join("\n")
end

ans = data.flatten.count { |x| x == '#' }
puts ans
