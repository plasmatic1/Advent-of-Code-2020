require_relative 'funs'

BAD = 556543474
data = load_data(9).split.map(&:to_i)

(0...data.length).each do |i|
    cur = 0
    (i...data.length).each do |j|
        cur += data[j]
        if cur == BAD
            sub = data[i..j]
            puts sub.min + sub.max
            exit!
        end
    end
end
