#!/usr/bin/env ruby
require 'pp'
require 'set'
data = File.read(ARGV[0]).strip.split(//)
points = Set.new
x = 0
y = 0
points << [x, y]
data.each do |c|
  case c
  when '^'
    y += 1
  when 'v'
    y -= 1
  when '>'
    x -= 1
  when '<'
    x += 1
  end
  points << [x, y]
end

pp points.count
