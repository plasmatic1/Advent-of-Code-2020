require_relative 'funs'
require 'scanf'

def pass(v, prop)
    (prop[1][0] <= v && v <= prop[1][1]) || (prop[2][0] <= v && v <= prop[2][1])
end

fmt, you, other = load_data(16).split("\n\n").map { |x| x.split("\n") }
you.slice!(0)
other.slice!(0)

props = fmt.map { |line|
    cap = /([a-z ]+): (\d+)-(\d+) or (\d+)-(\d+)/.match(line).captures
    a, b, c, d = cap.drop(1).map(&:to_i)
    [cap[0], [a, b], [c, d]]
}

# puts props.inspect

prop_data = other.map { |line| line.split(',').map(&:to_i) }.select {
    |vals| vals.map { |x| props.map { |prop| pass(x, prop) }.any? }.all? }.transpose

ans = 1
you = you[0].split(',').map(&:to_i)

# puts you.inspect
# puts prop_data.inspect

until props.length == 0
    fp = nil
    prop_data.each_with_index { |vals, i|
        follow_prop = props.select { |prop| vals.map { |x| pass(x, prop) }.all? }
        if follow_prop.length == 1
            fp = [follow_prop[0], i]
            break
        end
    }

    prop, idx = fp
    # puts "prop=#{prop}, idx=#{idx}, plen=#{props.length}"
    ans *= you[idx] if prop[0] =~ /departure/
    props.delete(prop)
end

puts ans
