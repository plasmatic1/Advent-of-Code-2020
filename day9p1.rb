require_relative 'funs'

data = load_data(9).split.map(&:to_i)

q = data[0...25]
data[25...data.length].each do |x|
    unless q.combination(2).any? { |a, b| a + b == x }
        puts x
        exit!
    end

    q.push(x)
    q.shift
end
