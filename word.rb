# require 'letter'

class Word
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def display_dash(dash_count)
    dash_count = @word.split("").count
      dash_count.times do
        print " _ "
      end
  end

  def list(word)
    word = "blue"
  end

  def check
    # counting guesses?
  end

  def correct_guess
    # display actual guess/word
  end

  def wrong_guess
    # display incorrect guess/es
  end

  def results
  end


end # end of word class

barb = Word.new("cat")
puts barb.display_dash("cat")
