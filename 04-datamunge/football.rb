require 'pp'

File.open('football.dat', "r") do |f|
 data = f.readlines
 spread = data[6..-2].collect do | data_line |
   l_split = data_line.split
   next if l_split.first[0..0] == '-'
   [(l_split[6].to_i - l_split[8].to_i).abs, l_split[1] ]
 end
 pp spread.compact.sort.first[1]
end