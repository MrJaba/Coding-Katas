words = {}
File.open("/usr/share/dict/words", 'r') {|f| f.each{ |l| words[l.chomp.downcase] = true if l.length  <= 7 } }
words.keys.select{|w|w.length == 6}.each do | word |
  [2,3].each do |i|
    a, b = word[0..i], word[i+1..-1]
    puts "#{word} => #{a}, #{b}" if (words[a] && words[b])
  end
end
