require 'pp'

File.open('weather.dat', "r") do |f|
 data = f.readlines
 spread = data[9..-2].collect do | data_line |
   l_split = data_line.split
   [l_split[1].to_i - l_split[2].to_i, l_split[0] ]
 end
 pp spread.sort.first[1]
end