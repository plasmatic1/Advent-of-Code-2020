require_relative 'funs'
require 'scanf'

ans = 0

load_data(2).scanf('%d-%d %c: %s') do |a, b, c, d|
    if (d[a-1] == c) != (d[b-1] == c)
        ans += 1
    end
end

puts ans
