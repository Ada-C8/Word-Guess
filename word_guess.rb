class Game

  def initialize
    @generate_answer = generate_answer
    # @guess = guess
  end

  def generate_answer
    @random_word = ["issue", "union", "refer", "bowel", "fence", "great", "valid", "urine", "glove", "money", "brick"]
    @random_word = @random_word.sample
  end

end # end class

# actual game play

game1 = Game.new
puts game1.generate_answer







puts "
 {o}{o}{o}
  |  |  |
  \|  \|  \|
[~~~~~~~~~]
 |~~~~~~~|
 |_______|
"
