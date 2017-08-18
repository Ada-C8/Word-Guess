# Word Class =============================
class Game

  attr_accessor :answer

  def initialize(answer_array)
    @answer = answer_array.sample.split(//)
    puts "the answer is #{@answer}"

    while running?
      play_game
    end
  end


  def answer
    return @answer
  end

  def play_game
    guess = Guess.new
    puts "Please enter the letter you'd like to guess."
    input_letter = gets.chomp
    is_correct_answer = guess.check(input_letter, @answer)
    if is_correct_answer
      guess.store_into_correct_letters(input_letter)
      guess.display_progress
    else
      guess.add_wrong_guess
    end
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

  attr_accessor :guess, :wrong_guesses, :correct_letters

  def initialize
    @wrong_guesses = []
    @correct_letters = []
  end
  # def guess
  #
  #     return print_answer(guess)
  #   else
  #     print "Wrong guess!"
  #   end
  # end

  def check(guess, answer)
    if answer.include?(guess)
      return true
    else
      return false
    end
  end

  def add_wrong_guess
    puts "wrong guess"
    return @wrong_guesses << guess
  end

  def store_into_correct_letters(guess)
    puts "word storage"
    @correct_letters << guess
    # if guess_check == true
    #   correct_letters << @guess
    # end
  end

  def display_progress
    puts @correct_letters
  end

  def counter

  end

end

answer_array = ["cat", "bat", "dog"]

# tests ===============================
word_try = Game.new(answer_array)

puts "Welcome to our word guess game!"

# word_try.play_game
# puts word_try.guess_check

# if word_try.guess
