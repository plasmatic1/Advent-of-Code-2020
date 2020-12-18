require_relative 'funs'
require 'set'

def outer(l)
    [l.min-1, l.max+1]
end

locs = Set.new(load_data(17).split("\n").map.with_index.map { |row, i| row.chars.map.with_index.select { |c, _| c == '#' }.map { |_, j| [i, j] }}.flatten(1).map { |x, y| [x, y, 0] })
# puts locs.inspect

6.times do
    xmin, xmax = outer(locs.map { |x, _, _| x })
    ymin, ymax = outer(locs.map { |_, y, _| y })
    zmin, zmax = outer(locs.map { |_, _, z| z })

    puts "xr=#{xmin}..#{xmax} yr=#{ymin}..#{ymax} zr=#{zmin}..#{zmax}"

    nxt = Set.new

    (xmin..xmax).each do |x|
        (ymin..ymax).each do |y|
            (zmin..zmax).each do |z|
                off = (-1..1).to_a
                nc = off.product(off, off).select { |arr| arr != [0, 0, 0] }.count { |xd, yd, zd| locs.include?([x + xd, y + yd, z + zd]) }
                if locs.include?([x, y, z]) && (nc == 2 || nc == 3)
                    nxt.add([x, y, z])
                elsif !locs.include?([x, y, z]) && nc == 3
                    nxt.add([x, y, z])
                end
            end
        end
    end

    locs = nxt
end

puts locs.length
