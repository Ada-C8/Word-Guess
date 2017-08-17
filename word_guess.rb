class Game

  def initialize
    @generate_answer = generate_answer
    # @guess = guess
    @incorrect_guess = 0

  end

  def generate_answer
    @random_word = ["issue", "union", "refer", "bowel", "fence", "great", "valid", "urine", "glove", "money", "brick"]
    @random_word = @random_word.sample.chars

  end


  def check_guess
    if @random_word.include? guess
      # call art method
      # AND display_partial_answer
    else
      # call art method
      add_incorrect_guess
    end
  end

  def add_incorrect_guess
    @incorrect_guess+=1
    end_game
  end

  def add_correct_guess
  end

  def display_art
  end

  def display_partial_answer
  end

  def end_game
    when @incorrect_guess=10
      break
  end

end # end class

# actual game play

game1 = Game.new
puts game1.generate_answer
game_live = true

while game_live
puts "Guess a letter"
guess = gets.chomp

# game2 = Game.new
# puts game2.generate_answer




end

puts "
{o}{o}{o}
|  |  |
\|  \|  \|
[~~~~~~~~~]
|~~~~~~~|
|_______|
"
