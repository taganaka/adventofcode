#!/usr/bin/env ruby
require 'pp'
require 'set'
class Graph
  def initialize(g)
    @conn = {}
    @edges = Set.new
    g.each do |d|
      p1, p2, dist = d
      @edges << p1
      @edges << p2
      @conn[[p1, p2]] = dist.to_i
      @conn[[p2, p1]] = dist.to_i
    end
  end

  def solve
    min = Float::INFINITY
    max = 0
    path = []
    path_max = []
    @edges.to_a.sort.permutation do |p|
      current = 0
      current_path = []
      p.each_with_index do |e, i|
        n = p[i + 1]
        break if n.nil?
        current += @conn[[e, n]]
        # break if current > min
        current_path << e
      end
      if current < min
        min = current
        path = current_path
      end
      if current > max
        max = current
        path_max = current_path
      end
    end
    [path, min, path_max, max]
  end
end
points = []
File.new(ARGV[0]).each_line do |line|
  # Faerun to Norrath = 129
  line.strip.scan(/(.*) to (.*) = (\d+)/) { |match| points << match }
end

path, min, mpath_max, max = Graph.new(points).solve
puts "#{path.join(' -> ')} #{min} --- #{mpath_max.join(' -> ')} #{max}"
