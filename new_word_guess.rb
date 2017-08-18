class Game

  def initialize(answer_array)
    @answer = answer_array.sample
    @correct_guesses = []
    @incorrect_guesses = []
    @tries = 5

    @answer_as_array = split_answer(@answer)

    while @tries > 0
      accept_user_guess
      display
      # if
    end

  end

  private

  def split_answer(answer)
    return answer.split(//)
  end

  def accept_user_guess
    puts "Please enter a letter"
    user_input = gets.chomp
    if @answer_as_array.include?(user_input)
      @correct_guesses << user_input
    else
      @incorrect_guesses << user_input
      @tries -= 1
    end
  end

  def correct_display
    display_array = ""
    @answer_as_array.each do |letter|
      if @correct_guesses.include? letter
        display_array << letter
      else
        display_array << "_"
      end
    end
    return display_array
  end

  def display
    puts "Correct guesses: #{correct_display}"
    puts "Incorrect guesses: #{@incorrect_guesses}"
    puts "You have this many tries left: #{@tries}"
  end

end


class Guess

  def initialize

  end


end


answer_array = ["bat"]


new_game = Game.new(answer_array)
