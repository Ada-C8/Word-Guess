class Word
  attr_accessor :random_word, :word_display
  def initialize (random_word)
    @random_word = random_word.split("")
    @word_display = word_display
  end

  def word_display
    @word_display = []
    random_word.length.times do
      # i.gsub("i", "_")
      @word_display.push " _ "
    end
    return @word_display
  end

  def reveal(letter)
    counter = 0
    @random_word.each do |alpha|
      if alpha == letter
        @word_display[counter] = letter
      end
      counter += 1
    end
    return @word_display
  end
end

# tanja = Word.new("Tanja")
# print tanja.word_display

# letters = ["G", "a", "l", "e"]

# numbers = ["_ ", "_ ", "_ ", "_ "]

# letter = "a"



gale = Word.new("Gale")
print gale.reveal("y")
print gale.reveal("y").join
