require_relative 'funs'

data = load_data(10).split.map(&:to_i)
data.push(0)
data.push(data.max + 3)
data.sort!

dp = Array.new(data.length, 0)
dp[0] = 1
data.each_with_index do |x, i|
    (i - 3..i - 1).each do |j|
        # puts "i=#{i} j=#{j} data=#{data[j]} alt=#{dp[j]}"
        if j >= 0 && x - data[j] <= 3
            dp[i] += dp[j]
        end
    end
end

puts dp[-1]
