#!/usr/bin/env ruby
require 'digest/md5'
KEY = 'ckczppom'

0.upto(Float::INFINITY) do |i|
  md5 = Digest::MD5.hexdigest("#{KEY}#{i}")
  if md5[0..4] == '00000'
    puts i
    break
  end
end
