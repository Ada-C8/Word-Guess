class Word
  attr_accessor :random_word
  def initialize (random_word)
    @random_word = random_word
  end

  def word_display
    word_display = []
    random_word.length.times do
      # i.gsub("i", "_")
      word_display.push "_"
    end
    return word_display
  end

end

tanja = Word.new("Tanja")
print tanja.word_display
