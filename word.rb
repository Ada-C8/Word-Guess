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

  def list(random_words)
    @word << random_words
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

random = ["cat", "dog", "frog", "horse", "bird", "monkey", "pidgeon", "mouse", "rabbit", "lama"].sample
barb = Word.new(random)
puts barb.display_dash("cat")
