# frozen_string_literal: true

def read_file(path)
  data = ''
  File.open(path, 'r') do |f|
    data = f.read
  end

  data
end

def load_data(day, task = 1)
  read_file "input/#{day}t#{task}"
end

def min(x, y)
  x < y ? x : y
end

def max(x, y)
  x < y ? y : x
end
