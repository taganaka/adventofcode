#!/usr/bin/env ruby
require 'pp'
def min_side(dims)
  dims.sort[0] * dims.sort[1]
end

def surface_area(dims)
  2 * (dims[0] * dims[1] + dims[0] * dims[2] + dims[1] * dims[2])
end

total = 0

File.new(ARGV[0]).each_line do |line|
  dim = line.strip.split('x').map(&:to_i)
  next if dim.count < 3
  total += (min_side(dim) + surface_area(dim))
end

puts total
