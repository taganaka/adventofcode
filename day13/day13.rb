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
      @conn[[p1, p2]] = dist
    end
  end

  def solve
    settings = []
    total = 0
    @edges.to_a.each do |name|
      settings << name if settings.empty?
      best = @conn.select { |k, _v| k.first == name }.sort_by { |_key, value| -value }.first
      settings << best[0].last
      total += best.last
    end
    pp settings
    pp total
  end

end

points = []
File.new(ARGV[0]).each_line do |line|
  # Alice would gain 71 happiness units by sitting next to Eric.
  token = line.strip.split(/ /)
  a = token.first
  b = token.last.delete('.')
  n = line =~ /would lose/ ? token[3].to_i * - 1 : token[3].to_i
  points << [a, b, n]
end

g = Graph.new(points)
g.solve
