#!/usr/bin/env ruby
require 'pp'
VOWELS = 'aeiou'.split(//).freeze
def nice?(str)
  chars = str.downcase.split(//)
  (str =~ /(ab|cd|pq|xy)/).nil? && !(str =~ /(.)\1/).nil? && (chars.count { |x| VOWELS.include?(x) } > 2)
end

total = 0
File.new(ARGV[0]).each_line do |line|
  total += 1 if nice?(line.strip)
end
puts total
puts nice?('haegwjzuvuyypxyu')
