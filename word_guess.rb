# Word Class =============================
class Game

  attr_accessor :answer

  def initialize(answer_array)
    @answer = answer_array.sample.split(//)
  end

  def play_game(guess)
    @guess = Guess.new
    @guess.guess_check
  end

  def print_answer(guess)
    # hold_answer = []
    #
    # @answer.each do |check|
    #   if check == guess
    #     hold_answer << guess
    #   else
    #     hold_answer << "_ "
    #   end
    # end
    # hold_answer_string = ""
    # hold_answer.each {|p| hold_answer_string << p}
    # return hold_answer_string
  end




  # def answer
  #   answer = @answer
  #   return answer
  # end

end

# Guess class ========================================
class Guess

  attr_accessor :guess


  # def guess
  #
  #     return print_answer(guess)
  #   else
  #     print "Wrong guess!"
  #   end
  # end

  def guess_check(guess)
    puts "Please enter the letter you'd like to guess."
    guess = gets.chomp
    @guess = guess
    if @answer.include?(guess)
      return true
    end
  end

  def wrong_guess
    wrong_guesses = []
    return wrong_guesses << guess
  end

  def word_storage
    correct_letters = []
    if guess_check == true
      correct_letters << @guess
    end
  end

  def counter

  end

end

answer_array = ["cat", "bat", "dog"]

# tests ===============================
word_try = Game.new(answer_array)

puts "Welcome to our word guess game!"
puts word_try.guess_check

# if word_try.guess
