require_relative 'funs'
require 'scanf'

# An approach like
# ans = data.map { |s| s.chars.reduce(0) { |pre, c| pre * 2 + (c == "R" || c == "B" ? 1 : 0) }}.max
# would probably work much better but I didn't think of it in time
data = load_data(5).split("\n")
ans = data.map { |s|
    8 * s[0..6].chars.each_with_index.map { |x, i| x == "B" ? 1 << (6 - i) : 0 }.sum +
      s[7..9].chars.each_with_index.map { |x, i| x == "R" ? 1 << (2 - i) : 0 }.sum }.max
puts ans
