require 'faker'
class Party

  attr_accessor :word, :word_array, :dash_word, :score, :wrong_guess, :max_wrong_guess, :guessed_letters

  def initialize
    @word = Faker::Color.color_name
    @word_array = @word.split("")
    @dash_word = "_ " * @word.length
    @score = 0
    @wrong_guess = 0
    @max_wrong_guess = 50 #easy = 5, medium, hard = 3
    @guessed_letters = []
  end

  def check_letter(guess_letter)
    @guessed_letters << guess_letter
    @guessed_letters.uniq!
    if @word_array.include? guess_letter
      @word_array.length.times do |index|
        if word_array[index] == guess_letter
          @dash_word[index * 2] = guess_letter
        end
      end
      @score += 1
    else
      @wrong_guess += 1
    end

    if winner
      puts "You win!!!!"
    elsif game_over
      puts "game over!!! the word was #{@word}"
    end

    return @word.include? guess_letter

  end

  def game_over
    return @wrong_guess == @max_wrong_guess
  end

  def winner
    #if no more dashes, win!
    return !(@dash_word.include? "_")
  end

end

party1 = Party.new
puts "Welcome to Word Guess!!!!!!"
print "Guess a letter: "
puts party1.dash_word
guess = gets.chomp
party1.check_letter(guess)

until party1.game_over || party1.winner
  puts "Letters Guessed:"
  puts party1.guessed_letters
  puts party1.dash_word
  print "Guess a letter: "
  guess = gets.chomp
  party1.check_letter(guess)

end
