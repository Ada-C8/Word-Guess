class Word
  attr_accessor :random_word, :word_display, :num_bad_guess
  def initialize (random_word)
    @random_word = random_word.split("")
    @word_display = Array.new(random_word.length, "_ ")
    @num_bad_guess = 0
  end

 def reveal(letter)
    counter = 0
    @changed = nil
    @random_word.each do |alpha|
      if alpha == letter
        @word_display[counter] = letter
        @changed = true
      end
      counter += 1
    end
    return @word_display
  end

  def count_bad_guess
    if @changed == nil
      @num_bad_guess += 1
      print "You have made #{@num_bad_guess} wrong guess(es)."
    end
    return @num_bad_guess
  end

end

class Game
  attr_accessor :random_word, :word_display, :num_bad_guess
  def initialize


   #when guesses_taken > guesses_allowed  game over
    #or
    #when guesses_taken == guesses_allowed && word_display.includes? " _ " game over
    #when guesses_taken == guesses_allowed && random_word != word_display game over
  end


 def play
    word = Word.new("faker")
    @bad_guess_allowed = word.random_word.length + 3
    while true
      print "\nLetter guess: "
      guess = gets.chomp.downcase
      print word.reveal(guess).join
      @num_bad_guess = word.count_bad_guess
      print @num_bad_guess
      if word.random_word == word.word_display #check for the 'win condition'
        puts "\nCongrats!"
        break
      end
      if @num_bad_guess == @bad_guess_allowed #if this happens the 'win condition', you lost :disappointed:
        puts "\nSorry, you're out of guesses!"
        break
      end
    end
  end
end

puts "Welcome to Word Guess!"

word = Game.new.play
