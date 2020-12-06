require_relative 'funs'

data = load_data(6).split("\n\n")

# puts data.map { |g| g.split("\n") }.map { |ppl| ppl.map(&:chars).flatten.group_by { |x| x }.values.select { |v| v == ppl.length }.length }.sum
puts data.map { |g| g.split("\n") }.map { |ppl| ppl.map(&:chars).flatten.group_by { |x| x }.values.select { |v| v.length == ppl.length }.length }.sum
