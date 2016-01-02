#!/usr/bin/env ruby

INPUT = 'hepxcrrq'

def next_password(str)
  ret = nil
  loop do
    str = str.next
    next if str =~ /i|o|l/
    next if str.scan(/(.)\1/).count < 2
    return str if ordered?(str)
  end
  ret
end

def ordered?(instr)
  ret = false
  0.upto(instr.size - 3) do |i|
    found = 0
    token = instr[i, 3].chars
    token[0, 2].each_with_index do |c, x|
      found += 1 if c.next == token[x + 1]
    end
    ret = (found == 2)
    break if ret
  end
  ret
end

sol1 = next_password(INPUT)
sol2 = next_password(sol1)

puts sol1
puts sol2
