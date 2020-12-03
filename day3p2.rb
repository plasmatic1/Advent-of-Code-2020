require_relative 'funs'
require 'scanf'

$grid = load_data(3).split
$n = $grid.length
$m = $grid[0].length

def check(a, b)
    res = 0
    x = 0
    y = 0
    while x < $n do
        if $grid[x][y % $m] == '#'
            res += 1
        end
        x += a
        y += b
    end
    res
end

puts check(1, 1) * check(1, 3) * check(1, 5) * check(1, 7) * check(2, 1)
