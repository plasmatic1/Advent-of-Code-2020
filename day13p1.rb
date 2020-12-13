require_relative 'funs'

lines = load_data(13).split("\n")

t = lines[0].to_i
ans = lines[1].split(',').select { |x| x != 'x' }.map(&:to_i).map { |x| [t + (x - t % x) % x, x] }.min
# puts ans.inspect
puts (ans[0] - t) * ans[1]
