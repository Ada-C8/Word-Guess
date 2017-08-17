class Game
attr_reader :hang_art
  def initialize(game_word)
  @game_word = game_word

  end
  puts "Welcome to Word-Guess!\nWe've selected a word, Please guess your first letter: "

  def hang_art
      <<-HEREDOC
      +---+
       |   |
       O   |
      /|\\  |
      / \\  |
           |
  =========
      HEREDOC
  end
end



class Word
  attr_reader :get_word
  def initialize(word_bank)
    @word_bank = word_bank
    @game_word = @game_word
  end

  def get_word
    @game_word = @word_bank.delete(@word_bank.sample)
    return @game_word
  end

end


word_bank = Word.new(["acorn", "acute", "bitty", "cooky", "doozy"])
word_bank.get_word
# new_game = Game.new(game_word)

puts word_bank.get_word
