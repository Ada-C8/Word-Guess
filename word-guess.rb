require 'faker'

class Word

  initialize(word: Faker::Dessert.variety)
    @word = word
    @letters = word.split("")
    @blanks = "_" * @letters.length
  end

  def contains?(letter_guess)
    return @letters.include?(letter_guess)
  end



end #end of class

class Game

  initialize
    @art = newart
    @word = Word.new
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
    if @word.contains?(user_guess)
      Game.reveal
    else
      @turns += 1
      Art.decompose
    end
    @guesses << user_guess
  end

end # end of class
