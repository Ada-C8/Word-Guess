class WORD
  attr_accessor :words

  def initialize(words)
    @words = words
  end

  def choose_word
    return @words.sample
  end
end
