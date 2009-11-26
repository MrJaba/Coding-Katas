require 'rubygems'
require 'ruby-debug'
class BloomFilter
  def initialize( hash_functions)
    @bitmap = {}
    @hash_functions = hash_functions
    populate_bitmap
  end
  
  def test_word( word_on_test )
    hashes = hash(word_on_test)
    includes = true
    hashes.each{|hash_val| includes &&= (@bitmap[hash_val] == 1)}
    includes
  end

private

  def populate_bitmap(src='/usr/share/dict/words')
    File.open( src, 'r' ) do |f|
      f.each_line {|line|
        hashes = hash( line.chomp )
        hashes.each{|hash_val| @bitmap[hash_val] = 1}
      }
    end    
  end
  
  def hash( word )
    hashes = []
    @hash_functions.each do |hash_function|
      hash_result = hash_function.call( word )
      hashes << hash_result
    end
    hashes
  end
  
end

hash_func_a = lambda do |str|
  len = str.length
  hash_val = 1315423911
  len.times{ |i|
    hash_val ^= ( ( hash_val << 5 ) + str[i] + ( hash_val >> 2 ) )
  }
  hash_val.to_s
end


a = BloomFilter.new([hash_func_a])
debugger
puts a.test_word("hello")
