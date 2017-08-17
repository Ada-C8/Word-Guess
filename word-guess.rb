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
      @blanks[index].replace letter_guess
    end
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

  def initialize
    @art = newart
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
      Game.reveal
    else
      @turns += 1
      Art.decompose
    end
    @guesses << user_guess
  end


  def reveal(user_guess)
    @blanks.replace_blanks(user_guess)
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
