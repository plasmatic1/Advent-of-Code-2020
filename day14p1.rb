require_relative 'funs'
require 'scanf'

all = (1 << 36) - 1

msk = ''
sto = {}
load_data(14).split("\n").each do |line|
    if line =~ /mask/
        msk = line.scanf('mask = %s')[0].reverse
    else
        idx, v = line.scanf('mem[%d] = %d')
        msk.chars.each_with_index { |x, i| v = (v & (all ^ (1 << i))) | (x.to_i * (1 << i)) if x != 'X' }
        sto[idx] = v
    end
end

puts sto.values.sum
