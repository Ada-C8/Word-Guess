require 'faker'
class Party

  def initialize
    @word = Faker::Color.color_name
    @word_array = @word.to_a
    @dash_word = "_ " * @word.length
    @score = 0
    @wrong_guess = 0
    @max_wrong_guess = 3
    @won = false
    #@right_letters = []
  end

  def check_letter(guess_letter)
    if @word_array.include? guess_letter
      @word_array.length.times do |index|
        if word_array[index] == guess_letter
          @dash_word[index * 2] = guess_letter
        end
      end
    else
      @wrong_guess += 1
    end
    return @word.include? letter
  end


end
