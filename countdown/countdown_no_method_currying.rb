#http://codingkata.org/katas/unit/nasa-countdown
start_num = ARGV[0].to_i

result = lambda do |x|
  x.call(x).call(start_num)
end.call( lambda do |f|
            lambda do |n|
              return [0] if n == 0
              return [n] + f.call(f).call(n-1)
            end
          end )

p (0..start_num).to_a.reverse, result
p (0..start_num).to_a.reverse == result