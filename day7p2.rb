require_relative 'funs'
require 'set'

data = load_data(7).split("\n")
$g = Hash.new { |hash, key| hash[key] = [] }

data.each do |line|
    fst = line.match(/([a-z]+ [a-z]+) bags/)[1]
    # puts fst.inspect, fst[1]

    line.scan(/(\d+) ([a-z]+ [a-z]+) bags?/).each { |num_str, node| $g[fst].push([node, num_str.to_i]) }
end

# puts $g["striped black"].inspect

$vis = {}
def rec(st)
    if $vis.include?(st)
        $vis[st]
    end
    $vis[st] = $g[st].map { |x, mul| rec(x) * mul }.sum + 1
end

ans = rec("shiny gold") - 1
puts ans
