#!/usr/bin/env ruby
require 'pp'

def fetch(matrix, x, y)
  n = []
  n << matrix[y][x + 1]
  n << ((x - 1) < 0 ? nil : matrix[y][x - 1])
  n << Array(matrix[y - 1])[x]
  n << Array(matrix[y + 1])[x]
  n << Array(matrix[y + 1])[x + 1]
  n << Array(matrix[y - 1])[x + 1]
  n << ((x - 1) < 0 ? false : Array(matrix[y - 1])[x - 1])
  n << ((x - 1) < 0 ? false : Array(matrix[y + 1])[x - 1])
  on = n.count { |e| e == true }
  off = n.count - on
  [on, off]
end

def dump_matrix(matrix)
  matrix.each do |_y, row|
    puts row.map { |e| e == false ? '.' : '#' }.join
  end
end

matrix = {}
line_num = 0
File.new(ARGV[0]).each_line do |line|
  matrix[line_num] = line.strip.chars.map { |e| e == '#' ? true : false }
  line_num += 1
end

100.times do
  next_matrix = {}
  matrix.each do |y, row|
    next_matrix[y] = []
    row.each_with_index do |c, x|
      on, _off = fetch(matrix, x, y)
      if c == true
        next_matrix[y][x] = on == 3 || on == 2
      else
        next_matrix[y][x] = on == 3
      end
    end
  end
  matrix = next_matrix.dup
end
total = 0
matrix.values.each do |row|
  total += row.count { |e| e == true }
end
puts total
