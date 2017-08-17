require 'faker'

class Word

  attr_reader :word, :letters, :blanks

  def initialize(word: Faker::Dessert.variety)
    @word = word
    @letters = word.split("")
    @blanks = "-" * @letters.length
  end

  # def contains?(letter_guess)
  #   return @letters.include?(letter_guess)
  # end

  def replace_blanks(letter_guess)
    indices = find_indices(letter_guess)

    indices.each do |index|
      @blanks[index] = letter_guess
    end
    puts @blanks
  end

  private

  def find_indices(letter_guess)
    indices = []

    (0..@letters.length).each do |index|
      if letter_guess == @letters[index]
        indices << index
      end
    end

    return indices
    # @letters.each do |letter|
    #   if letter_guess == letter

  end


end #end of class

class Game

  attr_reader :game_word, :guesses, :turns

  # just for testing
  attr_writer :game_word

  def initialize
    #@art = newart
    @game_word = Word.new
    @guesses = []
    @turns = 0
  end



  def guess(user_guess)
    # if user_guess.length > 1 && user_guess == @word
    #   Game.win
    if @guesses.include?(user_guess)
      puts "You guessed that letter already!"
      return
    end
    if @game_word.contains?(user_guess)
      reveal(user_guess)
    else
      @turns += 1
      #Art.decompose
    end
    @guesses << user_guess
  end


  def reveal(user_guess)
    @game_word.replace_blanks(user_guess)
    puts @game_word.blanks
  end

  def lose
    if @turns > 5
      puts "You lose :("
      exit
    end
  end

  def win
    if !@blanks.include?("-")
      puts "You win!"
      exit
    end
  end

end # end of class

game = Game.new

game.game_word = Word.new(word: "bananas")
puts "What's your guess?"

guess = gets.chomp.downcase

game.reveal(guess)
