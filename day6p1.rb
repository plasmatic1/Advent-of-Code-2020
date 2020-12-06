require_relative 'funs'

data = load_data(6).split("\n\n")

puts data.map { |group| group.split("\n").map(&:chars).flatten.uniq.length }.sum
