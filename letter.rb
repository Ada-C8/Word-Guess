class Letter
  attr_accessor :letter

  def initialize(letter)
    @letter = letter
  end

  def add_to_word

  #compare to word, add to space if part of word check?
  end

  def limit_input
    # to ensure only word is added at a time
  end

  def ascii_change
    # draw art associated with wrong guess
  end



end # end of letter class

letter = Letter.new(guess)
puts letter
