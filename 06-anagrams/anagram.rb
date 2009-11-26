class AnagramDictionary
  def generate_anagrams
    anagrams = Hash.new{|k,v| k[v] = []}
    words = File.open("/usr/share/dict/words", 'r'){ |f| f.readlines }
    words.each do |word|
      anagrams[word.chomp.downcase.split(//).sort.join] << word.chomp.downcase
    end
    anagrams
  end
end

anagrams = AnagramDictionary.new.generate_anagrams
#Remove No Anagrams
anagrams.reject!{ |k, v| v.length == 1 }
#Largest Set of Anagrams
puts anagrams.values.inject([]){ |largest, perms| perms.size > largest.size ? perms : largest }
#Longest Anagram
puts anagrams[anagrams.keys.sort {|x,y| y.length <=> x.length }.first]