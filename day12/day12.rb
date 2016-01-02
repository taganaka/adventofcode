#!/usr/bin/env ruby
require 'json'
require 'pp'
stack = []
data = JSON.parse(File.read(ARGV[0]))
total = 0
stack.push([data])

loop do
  element = stack.shift
  next if element.is_a?(Hash) && element.values.include?('red') # Second solution
  vals = element.respond_to?(:values) ? element.values : element
  break if vals.nil?
  vals.each do |v|
    next if v.is_a?(String)
    if v.is_a?(Fixnum)
      total += v
    else
      stack.push(v)
    end
  end
  break if stack.empty?
end
puts total
