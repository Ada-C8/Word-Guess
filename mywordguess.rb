class Word
  attr_accessor :random_word
  def initialize (random_word)
    @random_word = random_word.split("")
  end

  def word_display
    word_display = []
    random_word.length.times do
      # i.gsub("i", "_")
      word_display.push "_"
    end
    return word_display
  end

  def reveal(letter)
    if @random_word.include?(letter)
      @random_word.each do |i|
        if i == letter
          word_display[i] = letter
        end
      end
    end
    return word_display
  end

end

# tanja = Word.new("Tanja")
# print tanja.word_display



gale = Word.new("Gale")
print gale.reveal("a")
