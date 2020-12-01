require_relative 'funs.rb'
require 'set'

nums = load_data(1).split.map(&:to_i)

use = nums.to_set
puts nums.length
puts use.length

nums.each do |x|
    nums.each do |y|
        if use.include?(2020 - x - y)
            puts x * y * (2020 - x - y)
            exit!
        end
    end
end