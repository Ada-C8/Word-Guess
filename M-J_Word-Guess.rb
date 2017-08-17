#Maria and Julia's Word Guess Game!

# NOUNS / CLASSES
# The Game
# receive a guess letter
# check guessed letter against array of target word and array of guess errors
# display array of wrong guessed letters
# display Word

# The Word Class
# select the target word from a preset array
# create an array of the word letters
class Game

  #attr_accessor  :target_word

  def initialize (target_word)
    @target_word = target_word
    @guesses_left = 5 #number of flowers
    @wrong_letters = []
    @correct_letters = []
  end

  def receive_user_input
    #prompt the user
    run
    puts "Please enter a letter"
    letter_guess = gets.chomp
    check_for_letter(letter_guess)
  end

  def check_for_letter(letter_guess)
    current_word = ""
    input = false
    @target_word.each do |letter|
      if @correct_letters.include?(letter)
        character = letter
        input = true
      elsif letter == letter_guess
        character = letter_guess
        input = true
      else
        character = "-"
        @wrong_letters << letter
        input = false
      end
      current_word += character
    end #end do
    puts "Your current word: #{current_word}"
    if current_word.split(//) == @target_word
      "You won!"
      return
    else
      track_guess_count(input)
    end
  end #end of method

  def track_guess_count(input)
    if input = false
      puts "wrong!"
      @guesses_left -= 1
    else
      "correct!"
    end

  def run
    if @guesses_left > 0
      receive_user_input
    elsif @guesses_left = 0
      puts "You ran out of guesses! Game over."
      return
    end
  end

end #end of class

puts "Welcome to Maria and Julia's Word Game!"
word_array = ["hat", "math", "phony" ]
target_word = word_array.sample.split(//)
our_word = Game.new(target_word)
our_word.receive_user_input




# add in- DISPLAY THE LETTERS AS DASHES

# display letters that have been used already
# Points
# tallies the points / strings
# display art at the beginning of the game
# display the Art after every guess
