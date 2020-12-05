require_relative 'funs'
require 'scanf'

data = load_data(5).split("\n")
ans = data.map { |s|
    8 * s[0..6].chars.each_with_index.map { |x, i| x == "B" ? 1 << (6 - i) : 0 }.sum +
      s[7..9].chars.each_with_index.map { |x, i| x == "R" ? 1 << (2 - i) : 0 }.sum }.max
puts ans
