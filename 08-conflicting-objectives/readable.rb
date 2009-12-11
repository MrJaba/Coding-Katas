class SixLetterWord
  
  def initialize(word_string)
    @word_string = word_string
    raise WordLengthTooLong.new("Word has more than 6 letters in") if word_is_too_long?
  end
  
  def output_word_composition
    puts "#{@word_string} => #{first_word}, #{second_word}"
  end
  
  def is_composed_of_two_smaller_words?
    possible_word_formations.each do |first_word, second_word|
      if (Dictionary.contains_word?( first_word ) and Dictionary.contains_word?( second_word ))
        @first_word = first_word
        @second_word = second_word
      end
    end
    return true if (@first_word and @second_word)
  end
  
private

  def word_is_too_long?
    @word_string.length > 6    
  end
  
  def first_word
    @first_word
  end
  
  def second_word
    @second_word
  end
  
  def possible_word_formations
    word_formations = Array.new
    from = 0
    2.upto(3) do | to |
      first_section_of_string = split_word( from, to )
      second_section_of_string = split_word( to+1, @word_string.length )
      word_formations.push( [first_section_of_string, second_section_of_string ] )
    end    
    word_formations
  end
  
  def split_word( from, to )
    @word_string.slice(from..to)
  end
  
end


class Dictionary
  Path_to_dictionary = "/usr/share/dict/words"
  
  def self.contains_word?(word)
    words.include?(word)
  end
  
  def self.words_of_6_letters
    words.select{|word| word.length == 6 }
  end
  
private

  def self.words
    @words ||= remove_newlines_from_words( downcase_words( open_and_read_file_into_array ) )
  end
  
  def self.remove_newlines_from_words(word_array)
    word_array.collect{|word| word.chomp }
  end
  
  def self.downcase_words(word_array)
    word_array.collect{|word| word.downcase }
  end
  
  def self.open_and_read_file_into_array
    file_read_mode = 'r'
    word_array = Array.new
    File.open(Path_to_dictionary, file_read_mode) do |open_file|
      word_array = open_file.readlines
    end
    word_array
  end  
end

Dictionary.words_of_6_letters.each do |six_letter_word_string|
  six_letter_word = SixLetterWord.new(six_letter_word_string)
  six_letter_word.output_word_composition if six_letter_word.is_composed_of_two_smaller_words?
end