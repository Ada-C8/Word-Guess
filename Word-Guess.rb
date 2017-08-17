require 'faker'
class Party

  def initialize
    @word = Faker::Color.color_name
    @word_array = @word.to_a
    @score = 0
    @wrong_guess = 0
    @max_wrong_guess = 3
    @won = false
    @right_letters = []
  end

  def check_letter(letter)
    if @word.include? letter
      @right_letters << letter
      dash_word(letter)
    else
      @wrong_guess += 1
    end
    return @word.include? letter
  end

  def dash_word(letter)


  end
end
