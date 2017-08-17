require 'faker'
class Party

  attr_accessor :word, :word_array, :dash_word, :score, :wrong_guess, :max_wrong_guess

  def initialize
    @word = Faker::Color.color_name
    @word_array = @word.split("")
    @dash_word = "_ " * @word.length
    @score = 0
    @wrong_guess = 0
    @max_wrong_guess = 5 #easy = 5, medium, hard = 3
    #@right_letters = []
  end

  def check_letter(guess_letter)
    if @word_array.include? guess_letter
      @word_array.length.times do |index|
        if word_array[index] == guess_letter
          @dash_word[index * 2] = guess_letter
        end
      end
      @score += 1
    else
      if game_over
        puts "game over!!!"
      else
        @wrong_guess += 1
      end
    end
    return @word.include? guess_letter
  end

  def game_over
    return @wrong_guess == @max_wrong_guess
  end

end

# party1 = Party.new
# puts party1.word
# puts party1.dash_word
#
# party1.check_letter("a")
# party1.check_letter("e")
# party1.check_letter("i")
# party1.check_letter("o")
# party1.check_letter("u")
#
# puts party1.wrong_guess
# puts party1.score
# puts party1.dash_word
