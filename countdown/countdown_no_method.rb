#http://codingkata.org/katas/unit/nasa-countdown
start_num = ARGV[0].to_i

result = lambda do |f|
  return f.call(start_num, f)
end.call( lambda do |num, mk_f| 
                   return [0] if num == 0 
                   return [num] + mk_f.call(num-1, mk_f)
                 end )

p (0..start_num).to_a.reverse, result
puts (0..start_num).to_a.reverse  ==  result