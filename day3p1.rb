require_relative 'funs'
require 'scanf'

ans = 0

grid = load_data(3).split
n = grid.length
m = grid[0].length

# puts grid.length

x = 0
y = 0
while x < n do
    if grid[x][y % m] == '#'
        ans += 1
    end
    x += 1
    y += 3
end

puts ans
