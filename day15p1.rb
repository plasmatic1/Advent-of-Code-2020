require_relative 'funs'
require 'scanf'

st = load_data(15).split(',').map(&:to_i)
pre = {}
st[0...-1].each_with_index { |x, i| pre[x] = i }

# puts pre.inspect

cur = st[-1]
(st.length - 1...2019).each do |i|
    nxt = pre.include?(cur) ? i - pre[cur] : 0
    pre[cur] = i
    cur = nxt
end

puts cur
