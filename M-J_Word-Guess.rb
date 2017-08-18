
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

  def initialize(target_word)
    @target_word = target_word
    @guesses_left = 5 #number of flowers
    @wrong_letters = []
    @correct_letters = []
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
    puts "Please enter a letter"
    letter_guess = gets.chomp.downcase
    check_for_letter(letter_guess)
  end

  def check_for_letter(letter_guess)
    current_word = ""
    input = false
    @target_word.each do |letter|
      if @correct_letters.include?(letter)
        character = letter
        #input = true
      elsif letter == letter_guess
        character = letter_guess
        @correct_letters << character
        input = true
      # elsif @wrong_letters.include?(letter_guess)
      #   input = true
      else
        character = "-"
        @wrong_letters << letter
      end
      current_word += character
    end #end do
    puts "Your current word: #{current_word}"

    if current_word.split(//) == @target_word
      @won = true
      #play_again? method
    else
      track_guess_count(input)
    end
  end #end of method

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

    # puts @ART[ @guesses_left-1]




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
word_array = ["hat", "math", "phony" ]
target_word = word_array.sample.split(//)
our_word = Game.new(target_word)
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
