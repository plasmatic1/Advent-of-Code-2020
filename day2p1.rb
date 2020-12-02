require_relative 'funs'
require 'scanf'

ans = 0

load_data(2).scanf('%d-%d %c: %s') do |a, b, c, d|
    cnt = (d.chars.group_by { |c| c }[c] || []).length
    if a <= cnt && cnt <= b
        ans += 1
    end
end

puts ans
