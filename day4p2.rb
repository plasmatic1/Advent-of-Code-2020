require_relative 'funs'
require 'scanf'

$list = load_data(4).split("\n\n")
# puts $list.length

FIELDS = [/byr:(19[2-9][0-9]|200[1-2])/, /iyr:20(1[0-9]|20)/, /eyr:20(2[0-9]|30)/,
          /hgt:((1[5-8][0-9]|19[0-3])cm|(59|6[0-9]|7[0-6])in)/, /hcl:#[0-9a-f]{6}/,
          /ecl:(amb|blu|brn|gry|grn|hzl|oth)/, /pid:[0-9]{9}/].freeze
ans = 0
$list.each do |pass|
    good = true
    FIELDS.each do |f|
        if (f =~ pass).nil?
            good = false
            break
        end
    end
    if good
        ans += 1
    end
end

puts ans