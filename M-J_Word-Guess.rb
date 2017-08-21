
#Maria and Julia's Word Guess Game!
require 'faker'

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

  def initialize(target_word)
    @target_word = target_word
    @guesses_left = 5 #number of flowers
    @wrong_letters = []
    @correct_letters = []
    current_word = ""
    # = target_word.length.times do |x|
    #   puts "-"
    # end
    @won = false
    @ART = []
    art = <<ART
    H   H
    H   H
    HHHHH
    H   H
    H   H
ART

  @ART.push(art)

  art = <<ART
  H   H EEEEE
  H   H E
  HHHHH EEEEE
  H   H E
  H   H EEEEE
ART

@ART.push(art)

art = <<ART
H   H EEEEE L
H   H E     L
HHHHH EEEEE L
H   H E     L
H   H EEEEE LLLLL
ART

@ART.push(art)

art = <<ART
H   H EEEEE L     L
H   H E     L     L
HHHHH EEEEE L     L
H   H E     L     L
H   H EEEEE LLLLL LLLLL
ART

@ART.push(art)

art = <<ART
H   H EEEEE L     L      OOO
H   H E     L     L     O   O
HHHHH EEEEE L     L     O   O
H   H E     L     L     O   O
H   H EEEEE LLLLL LLLLL  OOO
ART

@ART.push(art)

  end

  def receive_user_input
    #prompt the user
    puts "\nPlease enter a letter"
    letter_guess = gets.chomp.downcase
    choose_path(letter_guess)
    store_wrong_letter(letter_guess)
    #check_for_correct_letter_and_build_word(letter_guess)
    puts "wrong letters: #{@wrong_letters}"
    puts "correct letters: #{@correct_letters} \n"

    #puts ""
  end #end of receive_user_input

  # def check_if_used
  #   if @wrong_letters.include?(letter_guess)
  #     puts "You already guessed that letter. Try again"
  #     receive_user_input
  #   end
  # end #end of check_if_used

  def choose_path(letter_guess)
    if @wrong_letters.include?(letter_guess) || @correct_letters.include?(letter_guess)
      puts "You already tried that letter."
    elsif wrong_letter?(letter_guess)
      puts "it IS a wrong a letter!"
      # store_wrong_letter(letter_guess)
      track_guess_count(false)
    else
      puts "it is not a wrong letter!"
      check_for_correct_letter_and_build_word(letter_guess)
    end
  end

  def check_for_correct_letter_and_build_word(letter_guess)
    current_word = ""
    input = false
    #wrong_letter = ""

    @target_word.each do |letter|
      if @correct_letters.include?(letter) #True if letter is already stored in correct_letters
        character = letter
      elsif letter == letter_guess
        character = letter_guess
        @correct_letters << character
        input = true
      else
        character = "-"
      end
      current_word += character
    end #end do

    puts "Your current word: #{current_word}"
######
    if current_word.split(//) == @target_word
      @won = true
      #play_again? method
    else
      track_guess_count(input)
    end
  end #end of method

  def wrong_letter?(letter_guess)
    if @target_word.include?(letter_guess)
      return false
    else
      return true
    end #if the letter guess is in the target word, it returns false
  end

  def store_wrong_letter(letter_guess)
    if wrong_letter?(letter_guess) && !@wrong_letters.include?(letter_guess)
      @wrong_letters << letter_guess
    else
      puts "We don't have anything to put in wrong_letters array"
    end
  end

  def won?
    return @won
  end

  def track_guess_count(input)
    if input == false
      puts "wrong!"
      @guesses_left -= 1
    else
      "correct!"
    end

    if @guesses_left == 0
    else
      puts @ART[ @guesses_left-1]
    end

    puts "You have #{@guesses_left} guesses left!"
  end

  def run
    if @guesses_left > 0
      receive_user_input
    elsif @guesses_left == 0
      puts "You ran out of guesses! Game over."
      return
    end #end of if
  end #end of run

  def guesses_left?
    if @guesses_left > 0
      true
    else
      false
    end
  end

end #end of class


puts "Welcome to Maria and Julia's Word Game!"
word = Faker::Dessert.variety
puts "Word: #{word}"
word = word.downcase
#puts "Word downcased: #{word}"
#word_array = [word]
target_word = word.split(//)
puts "Our target word: #{target_word}"
our_word = Game.new(target_word)
puts "Your word is:"
target_word.length.times do |x| print "-"
  end
#puts our_word.ART

while our_word.won? == false && our_word.guesses_left? == true
  our_word.run
end

if our_word.won?
  puts "Congrats you've won!"
elsif !our_word.guesses_left?
  puts "Sorry you lose!"
else
  puts "ERROR!"
end



# add in- DISPLAY THE LETTERS AS DASHES

# display letters that have been used already
# Points
# tallies the points / strings
# display art at the beginning of the game
# display the Art after every guess
