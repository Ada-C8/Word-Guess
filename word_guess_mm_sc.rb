class Game
attr_reader :hang_art
  def initialize(letter_array)
    @letter_array = letter_array
    @under_score  = under_score
    @guess_index = guess_index
    @guess = guess

  end

# --------------------------------
  def guess_check
      @letter_array.each do |letter|
        if @guess == letter_array.include?(@guess)
          @guess_index = @letter_array.index(@guess)
          return @guess_index
        end
    end
  end

    def user_interface
      puts "Welcome to Word-Guess!\nWe've selected a word, Please guess your first letter: "
      @guess = gets.chomp
    end


  def replace_index
    @under_score = ["_","_","_","_","_"]
    @under_score = @under_score.map do |x|
      if x == @guess_index
        x = @guess
      else
        x
      end
    end
  end
# -------------------------

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
  end

  def get_word
    @game_word = @word_bank.delete(@word_bank.sample)
    @letter_array = @game_word.split(//)
    return @letter_array
  end

end


word_bank = Word.new(["acorn", "acute", "bitty", "cooky", "doozy"])

# word_bank.get_word
new_game = Game.new(letter_array)


puts word_bank.get_word
