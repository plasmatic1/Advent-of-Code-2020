require_relative 'funs'
require 'scanf'
require 'set'

data = load_data(8).scanf("%s %d") { |l| l } # so it keeps reading until done

def get_result(data)
    ptr = 0
    ans = 0
    vis = Set.new

    until vis.include?(ptr)
        if ptr >= data.length
            return [ans, false]
        end
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
    [ans, true]
end

def swp(x)
    x == 'nop' ? 'jmp' : 'nop'
end

(0...data.length).each do |i|
    op, _ = data[i]
    if op == 'nop' || op == 'jmp'
        puts "Switching op #{i}: #{op} #{_}"
        data[i][0] = swp(op)
        ans, loop = get_result(data)
        if !loop
            puts ans
            exit!
        end
        data[i][0] = swp(data[i][0])
    end
end

puts ans
