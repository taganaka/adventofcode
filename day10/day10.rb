#!/usr/bin/env ruby
require 'pp'
current = '1113122113'
# 131213
# 311311222113
# [["1", "1"], [], [], ["2"], ["1"]]
def solve(input)
  data = input.chars
  buckets = []
  current = []
  data.each_with_index do |c, i|
    n = data[i + 1]
    current << c
    unless n == c
      buckets << current
      current = []
    end
    break if n.nil?
  end

  ret = ''
  buckets.each do |b|
    ret += b.count.to_s
    ret += b.first
  end
  ret
end

40.times do |_i|
  current = solve(current)
end
puts current.size
