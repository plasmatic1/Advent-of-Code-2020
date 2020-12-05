require_relative 'funs'
require 'set'
require 'scanf'

data = load_data(5).split("\n")
ids = data.map { |s|
    8 * (s[0..6].chars.each_with_index.map { |x, i| x == "B" ? 1 << (6 - i) : 0 }.sum) +
        (s[7..9].chars.each_with_index.map { |x, i| x == "R" ? 1 << (2 - i) : 0 }.sum) }
idset = Set.new(ids)

# puts idset.sort
(ids.min..ids.max).each do |x|
    if idset.include?(x - 1) && idset.include?(x + 1) && !idset.include?(x)
        puts x
        exit!
    end
end
