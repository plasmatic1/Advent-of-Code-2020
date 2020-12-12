require_relative 'funs'
require 'scanf'

$x = 0
$y = 0
$xd = 1
$yd = 0

def rot
    x2 = -$yd
    y2 = $xd
    $xd = x2
    $yd = y2
end

load_data(12).split.each do |_s|
    d, n = _s.scanf('%c%d')
    # puts "d=#{d} n=#{n}"
    if d == 'N'
        $y += n
    elsif d == 'S'
        $y -= n
    elsif d == 'E'
        $x += n
    elsif d == 'W'
        $x -= n
    elsif d == 'F'
        $x += $xd * n
        $y += $yd * n
    else
        n /= 90
        n = 4 - n if d == 'R'
        n.times { rot }
    end

    # puts "p=#{$x}, #{$y}"
end

puts $x.abs + $y.abs
