require_relative 'funs'

# from https://rosettacode.org/wiki/Chinese_remainder_theorem#Ruby
# Sorry I wanted to be fast.... and I don't remember how to do CRT
def extended_gcd(a, b)
    last_remainder, remainder = a.abs, b.abs
    x, last_x, y, last_y = 0, 1, 1, 0
    while remainder != 0
        last_remainder, (quotient, remainder) = remainder, last_remainder.divmod(remainder)
        x, last_x = last_x - quotient*x, x
        y, last_y = last_y - quotient*y, y
    end
    return last_remainder, last_x * (a < 0 ? -1 : 1)
end

def invmod(e, et)
    g, x = extended_gcd(e, et)
    if g != 1
        raise 'Multiplicative inverse modulo does not exist!'
    end
    x % et
end

def chinese_remainder(mods, remainders)
    max = mods.inject( :* )  # product of all moduli
    series = remainders.zip(mods).map{ |r,m| (r * max * invmod(max/m, m) / m) }
    series.inject( :+ ) % max
end

lines = load_data(13).split("\n")

t = lines[0].to_i
mods = lines[1].split(',').map.with_index.select { |x, _| x != 'x' }.map { |x, i| [x.to_i, i] }

# puts mods.inspect

init = chinese_remainder(mods.map { |x, _| x }, mods.map { |x, i| -i % x })
lcm = mods.map { |x, _| x }.reduce(1, :lcm)

# puts "init=#{init}, lcm=#{lcm}"

difd = (t - init) / lcm
init += difd * lcm
if init < t
    init += lcm
end

puts init
