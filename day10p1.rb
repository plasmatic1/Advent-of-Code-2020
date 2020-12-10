require_relative 'funs'

data = load_data(10).split.map(&:to_i).sort
d = Array.new(4, 0)

pre = 0
data.each do |x|
    d[x - pre] += 1
    pre = x
end
d[3] += 1

puts d[1] * d[3]
