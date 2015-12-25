#!/usr/bin/env ruby
require 'pp'
opcodes = []
File.new(ARGV[0]).each_line do |line|
  opcodes << line.strip.scan(/(?:(?:(\S+) )?(.*) )?(\S+) -> (\S+)/im).flatten
end
points = {}
loop do
  opcodes.each do |code|
    a, op, b, out = code
    case op
    when nil
      if b =~ /\d+/
        points[out] = b.to_i
      else
        next if points[b].nil?
        points[out] = points[b]
      end
      next
    when 'RSHIFT'
      next if points[a].nil?
      points[out] = points[a] >> b.to_i
    when 'LSHIFT'
      next if points[a].nil?
      points[out] = points[a] << b.to_i
    when 'NOT'
      next if points[b].nil?
      points[out] = ~points[b]
    when 'OR'
      next if points[a].nil? || points[b].nil?
      points[out] = points[a] | points[b]
    when 'AND'
      next if points[a].nil? || points[b].nil?
      points[out] = points[a] & points[b]
    else
      fail("#{op} not supported")
    end
  end
  break unless points['a'].nil?
end
# end
pp points
