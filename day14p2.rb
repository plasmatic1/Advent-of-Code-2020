require_relative 'funs'
require 'scanf'

ALL = (1 << 36) - 1

def force_bit(v, i, val)
    (v & (ALL ^ (1 << i))) | (val * (1 << i))
end

msk = ''
sto = {}
load_data(14).split("\n").each do |line|
    if line =~ /mask/
        msk = line.scanf('mask = %s')[0].reverse
    else
        idx, v = line.scanf('mem[%d] = %d')
        # msk.chars.each_with_index { |x, i| v = force_bit(v, i, x.to_i) if x != 'X' }
        idx = msk.chars.map.with_index.select { |x, _| x == '1' }.map { |_, i| i }.reduce(idx) { |pre, arg| pre | (1 << arg)}

        trail = msk.chars.map.with_index.select { |x, _| x == 'X' }.map { |_, i| i }
        (0..trail.length).each do |l|
            trail.combination(l) do |comb|
                sto[trail.reduce(idx) { |pre, i| force_bit(pre, i, comb.include?(i) ? 1 : 0)}] = v
            end
        end
    end
end

puts sto.values.sum
