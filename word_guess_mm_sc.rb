class Game
attr_reader :hang_art, :letter_array, :under_score, :guess_index, :guess, :guess_check
  def initialize(letter_array)
    @letter_array = letter_array
    @under_score  = under_score
    @guess_index = guess_index
    @guess = guess

  end

# --------------------------------
  def guess_check
      @guess_index = []
      @letter_array.each do |letter|
        if @guess == letter_array.include?(@guess)
          @guess_index << @letter_array.index(@guess)

        end

    end
   return @guess_index
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
    under_score = @under_score
    return under_score
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
  attr_reader :word_bank, :game_word, :letter_array, :get_word
  def initialize(word_bank)
    @word_bank = word_bank
    @game_word = game_word
    @letter_array = letter_array

  end

  def get_word(word_bank)
    @game_word = @word_bank.delete(@word_bank.sample)
    @letter_array = @game_word.split(//)
    letter_array = @letter_array
    return letter_array
  end

end


word_bank = Word.new(["acorn", "acute", "aitty", "aooky", "aoozy"])
letter_array = word_bank.get_word(word_bank)

# word_bank.get_word
new_game = Game.new(letter_array)
new_game.user_interface
new_game.guess_check
new_game.replace_index
puts new_game.replace_index


#puts word_bank.get_word
# guess = "a"
# guess_index = []
# letter_array = ["a","b", "a"]
# under_score = ["_","_","_"]
# letter_array.each do |letter|
#   if guess == letter_array.include?(guess)
#     guess_index << letter_array.index(guess)
#   end
# end
# puts guess_index
# under_score = under_score.map do |x|
#   if x == guess_index
#     x = guess
#   end
# end
# puts under_score
