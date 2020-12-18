require_relative 'funs'
require 'scanf'

fmt, _, other = load_data(16).split("\n\n").map { |x| x.split("\n") }
other.slice!(0)

range = fmt.map { |line|
    a, b, c, d = /[a-z ]+: (\d+)-(\d+) or (\d+)-(\d+)/.match(line).captures.map(&:to_i)
    [[a, b], [c, d]]
}.flatten(1)

# puts other.map { |line| line.split(',').map(&:to_i) }.flatten.inspect
ans = other.map { |line| line.split(',').map(&:to_i) }.flatten.select { |x| !range.map { |a, b| a <= x && x <= b }.any? }.sum
puts ans
