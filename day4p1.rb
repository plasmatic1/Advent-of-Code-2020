require_relative 'funs'
require 'scanf'

$list = load_data(4).split("\n\n")
# puts $list.length

FIELDS = [/byr/, /iyr/, /eyr/, /hgt/, /hcl/, /ecl/, /pid/].freeze
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