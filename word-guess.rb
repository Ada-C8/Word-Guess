
## CLASS DEFINITIONS

class Word
  attr_reader :stored_letters

  def initialize(given_word)
    @stored_letters = Array.new
    given_word.each_char {|c| @stored_letters << c }

    done_array = []
    @stored_letters.each_index do |index|
      if done_array.include?(@stored_letters[index])
        # how do we make sure the letter object is passed here?
        Letter.position << index
      else
        Letter.new(@stored_letters[index], [index])
        done_array << @stored_letters[index]
      end
    end
  end
end # end of Word class definition

class Letter

  def initialize(letter, positions)
    @visible = false
    @positions = positions
    Word.stored_letters
  end
end
