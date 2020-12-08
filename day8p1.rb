require_relative 'funs'
require 'scanf'
require 'set'

data = load_data(8).scanf("%s %d") { |l| l } # so it keeps reading until done

ptr = 0
ans = 0
vis = Set.new

until vis.include?(ptr) || ptr >= data.length
    op, num = data[ptr]
    # puts "p=#{ptr} op=#{op} n=#{num}"
    vis.add(ptr)
    if op == "acc"
        ans += num
        ptr += 1
    elsif op == "jmp"
        ptr += num
    else
        ptr += 1
    end
end

puts ans
