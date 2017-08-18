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

class Game
  attr_accessor :random_word
  def initialize
    @win = false
    @guesses_taken = 0
    @guesses_allowed = 5  #random_word.length , does it need to be an argument in initialize?

    #when guesses_taken > guesses_allowed  game over
    #or
    #when guesses_taken == guesses_allowed && word_display.includes? " _ " game over
    #when guesses_taken == guesses_allowed && random_word != word_display game over
  end

  def play
    word = Word.new("faker")
    while @win == false
      @guesses_allowed.times do
        puts "Please guess the letter"
        guess = gets.chomp.downcase
        word.reveal(guess) #
        @guesses_taken += 1
        if @random_word == @word_display #is not comparing
          @win = true
          puts "Congrats!"
        end
      end
    end
  end
end
# tanja = Word.new("Tanja")
# print tanja.word_display

# letters = ["G", "a", "l", "e"]

# numbers = ["_ ", "_ ", "_ ", "_ "]

# letter = "a"

puts "welcome to the game"

word = Game.new.play


# gale = Word.new("foobarfoo")
# print gale.reveal()
# print gale.reveal("f")

#
# print gale.word_display
