#!/usr/bin/env ruby

INPUT = 'hepxcrrq'

def ordered?(instr)
  ret = false
  0.upto(instr.size - 3) do |i|
    found = []
    token = instr[i, 3].chars
    token[0, 2].each_with_index do |c, x|
      found << (c.next == token[x + 1])
    end
    ret = found == [true, true]
    break if ret
  end
  ret
end
str = INPUT
loop do
  str = str.next
  next if str =~ /i|o|l/
  next if str.scan(/(.)\1/).count < 2
  if ordered?(str)
    puts str
    break
  end
end
