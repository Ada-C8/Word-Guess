require 'faker'
require 'colorize'
require 'artii'



class Word
  attr_accessor :random_word, :word_display, :num_bad_guess, :bad_letters, :letter
  def initialize (random_word)
    @random_word = random_word.split("")
    @word_display = Array.new(random_word.length, "_ ") #make array of underscores
    @num_bad_guess = 0 #had to give it initial val so that we cound increment it with count bad guess method
    @bad_letters = []
  end

  def reveal(letter)
    @letter = letter
    counter = 0 # keeps track of random word index number
    @changed = nil
    @random_word.each do |alpha|
      if alpha == @letter
        @word_display[counter] = @letter
        @changed = true # indicates that guess was right
      end
      counter += 1
    end
    return @word_display
  end

  def count_bad_guess
    unless @letter == @random_word.join("")
      if @changed == nil #checks to see if guess was wrong
        @num_bad_guess += 1 # if guess is wrong increments bad guess otherwise  gives "free" guess
        @bad_letters << @letter
        puts "\nNumber of failed guesses: #{@num_bad_guess}"
        puts "Letters you have guessed: #{@bad_letters.join(", ")}." #prints to user how many bad guesses they took
      end
      return @num_bad_guess #otherwise method returns nil
    end
  end

end

class Game
  attr_accessor :random_word, :word_display, :num_bad_guess, :bad_letters, :letter
  def initialize


    #when guesses_taken > guesses_allowed  game over
    #or
    #when guesses_taken == guesses_allowed && word_display.includes? " _ " game over
    #when guesses_taken == guesses_allowed && random_word != word_display game over
  end


  def play
    word = Word.new(Faker::Hipster.unique.word.downcase)
    @bad_guess_allowed = word.random_word.length + 3

    while true
      print "\nLetter guess: "
      guess = gets.chomp.downcase
      print word.reveal(guess).join
      @num_bad_guess = word.count_bad_guess

      if word.random_word == word.word_display  || guess == word.random_word.join("")
        #check for the 'win condition'
        puts "\nCongrats!"
        break
      end
      if @num_bad_guess == @bad_guess_allowed #if this happens the 'win condition', you lost :disappointed:
        puts "\nSorry, you're out of guesses! The word was #{word.random_word.join("")}. Rad."
        break
      end
    end
  end
end

puts "Welcome to Word Guess!"

word = Game.new.play
