require_relative 'funs'
require 'set'

def outer(l)
    [l.min-1, l.max+1]
end

locs = Set.new(load_data(17).split("\n").map.with_index.map { |row, i| row.chars.map.with_index.select { |c, _| c == '#' }.map { |_, j| [i, j] }}.flatten(1).map { |x, y| [x, y, 0, 0] })
# puts locs.inspect

6.times do
    xmin, xmax = outer(locs.map { |x, _, _, _| x })
    ymin, ymax = outer(locs.map { |_, y, _, _| y })
    zmin, zmax = outer(locs.map { |_, _, z, _| z })
    wmin, wmax = outer(locs.map { |_, _, _, w| w })

    puts "xr=#{xmin}..#{xmax} yr=#{ymin}..#{ymax} zr=#{zmin}..#{zmax}, wr=#{wmin}..#{wmax}"

    nxt = Set.new

    (xmin..xmax).each do |x|
        (ymin..ymax).each do |y|
            (zmin..zmax).each do |z|
                (wmin..wmax).each do |w|
                    off = (-1..1).to_a
                    nc = off.product(off, off, off).select { |arr| arr != [0, 0, 0, 0] }.count { |xd, yd, zd, wd| locs.include?([x + xd, y + yd, z + zd, w + wd]) }
                    if locs.include?([x, y, z, w]) && (nc == 2 || nc == 3)
                        nxt.add([x, y, z, w])
                    elsif !locs.include?([x, y, z, w]) && nc == 3
                        nxt.add([x, y, z, w])
                    end
                end
            end
        end
    end

    locs = nxt
end

puts locs.length
