require_relative 'funs'
require 'set'

data = load_data(7).split("\n")
$g = Hash.new { |hash, key| hash[key] = [] }

data.each do |line|
    mat = line.scan(/([a-z]+ [a-z]+) bags?/).flatten.map(&:strip)
    mat[1...mat.length].each do |adj|
        $g[adj].push(mat[0])
    end
end

$vis = Set.new()
def rec(st)
    if $vis.include?(st)
        return
    end
    $vis.add(st)
    $g[st].each { |x| rec(x) }
end
rec("shiny gold")

puts $vis.length - 1
