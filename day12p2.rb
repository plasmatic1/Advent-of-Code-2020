require_relative 'funs'
require 'scanf'

$sx = 0
$sy = 0
$wx = 10
$wy = 1

def rot90(x, y)
    [-y, x]
end

load_data(12).split.each do |_s|
    d, n = _s.scanf('%c%d')
    # puts "d=#{d} n=#{n}"
    if d == 'N'
        $wy += n
    elsif d == 'S'
        $wy -= n
    elsif d == 'E'
        $wx += n
    elsif d == 'W'
        $wx -= n
    elsif d == 'F'
        dx = $wx - $sx
        dy = $wy - $sy

        $sx += dx * n
        $sy += dy * n

        $wx = $sx + dx
        $wy = $sy + dy
    else
        n /= 90
        n = 4 - n if d == 'R'

        dx = $wx - $sx
        dy = $wy - $sy

        n.times { dx, dy = rot90(dx, dy) }
        $wx = $sx + dx
        $wy = $sy + dy
    end

    # puts "p=#{$x}, #{$y}"
end

puts $sx.abs + $sy.abs
