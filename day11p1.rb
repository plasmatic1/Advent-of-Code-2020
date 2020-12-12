require_relative 'funs'

data = load_data(11).split.map(&:chars)

def extend(grid)
    nxt = Array.new(grid.length) { Array.new(grid[0].length, '.')}
    (0...grid.length).each do |i|
        (0...grid[0].length).each do |j|
            occ = grid[i][j] == '#' ? -1 : 0
            (i - 1..i + 1).each do |k|
                next if k < 0 || k >= grid.length
                occ += grid[k][[j - 1, 0].max..[j + 1, grid[0].length - 1].min].count { |x| x == '#' }
            end

            if grid[i][j] == 'L'
                nxt[i][j] = occ == 0 ? '#' : 'L'
            elsif grid[i][j] == '#'
                nxt[i][j] = occ >= 4 ? 'L' : '#'
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
