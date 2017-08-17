
## CLASS DEFINITIONS

class Word


  def initialize(given_word)
    @stored_letters = Array.new
    given_word.each_char {|c| @stored_letters << c }
  end


end
