class FileReader
  attr_accessor :data_start, :filename, :skip

  def initialize(filename, data_start, skip=nil)
    self.filename = filename
    self.data_start = data_start.to_i
    self.skip = skip
  end

  def compare(x,y, data_name)
    File.open(self.filename, "r") do |f|
      data = f.readlines
      spread = data[self.data_start..-2].collect do | data_line |
        next if self.skip && data_line.strip.include?(self.skip)
        l_split = data_line.split
        [(l_split[x].to_i - l_split[y].to_i).abs, l_split[data_name] ]
      end
      spread.compact.sort.first[1]
    end
  end
end


fb = FileReader.new('football.dat', 6, '-------------------------------------------------------')
puts "football: #{fb.compare(6,8,1)}"

we = FileReader.new('weather.dat', 9)
puts "weather: #{we.compare(1,2,0)}"
