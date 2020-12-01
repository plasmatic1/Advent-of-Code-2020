require_relative 'funs.rb'

nums = load_data(1).split.map(&:to_i)

for i in 0...nums.length do
    for j in i+1...nums.length do
        if nums[i] + nums[j] == 2020
            puts nums[i] * nums[j]
            exit!
        end
    end
end
