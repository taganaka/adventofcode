#!/usr/bin/env ruby
require 'digest/md5'
KEY = 'ckczppom'
five_found = false
six_found = false
0.upto(Float::INFINITY) do |i|
  md5 = Digest::MD5.hexdigest("#{KEY}#{i}")
  if md5[0..4] == '00000' && !five_found
    puts "#{i} #{md5}"
    five_found = true
  end
  if md5[0..5] == '000000' && !six_found
    puts "#{i} #{md5}"
    six_found = true
  end
  break if six_found && five_found
end
