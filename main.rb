#  Word Game


# Intro to user
# selects difficulty ?
# word bank -
  # maybe in its own class maynot,
  # maybe one word bank depending difficulty?
# Find word in word bank.


# Display game board to user
  # Image/ASCII art
  # Blank letter spaces
  # Letters already guessed?
# Ask user to guess a letter
# Store the user input
  # CHeck array for guessed
  # If it's in array ask for another guess.
  # If not then store in array.
  #   check if guess is in word.
  #   Update screen accordingly.
  #     Add letter
  #     take flower away (tries).
# Loop ends:
  # If tries run out.
  #   Show a losing screed
  # Or if whole word is guessed.
  #   Show a winning screen.

# Ask user if they want to play again.
#   if yes then loop to begining of Game
#   Or no then display a thank and goodbye.

###################################
#  Word Game
###################################
# require "Faker"
require_relative "word_bank"

class Board

  attr_accessor :letters_guessed, :tries_remaining
  attr_reader :word, :blank

  def initialize(word)
    @word = word
    @blank = "_" * @word.length
    @letters_guessed = []
    @tries_remaining = 4
    @tries_pictures = [
    "
         _,
      .-'_|
     _| (_|
    (_|
    ",
    "
         _,
      .-'_|      ,
     _| (_|     _|\\
    (_|        (_|
    ",
    "
         _,                _,
      .-'_|      ,      .-'_|
     _| (_|     _|\\    _| (_|
    (_|        (_|    (_|
    ",
    "
         _,                _,
      .-'_|      ,      .-'_|      ,
     _| (_|     _|\\    _| (_|     _|\\
    (_|        (_|    (_|        (_|
    "
    ]
  end

  def puts_pictures
    puts @tries_pictures
  end

  def display
    output = ""
    output += @tries_pictures[@tries_remaining-1] + "\n"
    output += @blank + "\n"
    output += "Letters Guessed: #{@letters_guessed.join(' ')}"
    return output
  end

  # def add_letter(guess)
  #   letter_location = @word.index(guess)
  #   @blank[letter_location] = guess
  # end

  def add_letter(guess)
    letter_location = []
    # word = "coffee"
    @word.split('').each_with_index do |letter,index|
      # puts "checking #{letter}, index is #{index}"
      # puts "checking if letter: #{letter} is guess: #{guess}"
      if letter == guess
        # puts "#{letter} is #{guess} at index #{index}"
        letter_location << index
        # puts "letter_location is now #{letter_location}"
      end
    end
    letter_location.each do |index|
      @blank[index] = guess
    end
  end

end


# Intro to user
puts "Welcome to Kate and Angela's Word Game!"

# selects difficulty ?
# word bank -
word_bank = initialize_word_bank()
  # maybe in its own class maynot,
  # maybe one word bank depending difficulty?
# Find word in word bank.
# game_word = word_bank.sample

game_board = Board.new(word_bank.sample.upcase)

# Display game board to user
  # Image/ASCII art -
    #  "/////////*"
  # Blank letter spaces
  # Letters already guessed?
#


user_has_won = !(game_board.blank.include?"_")
user_has_lost = game_board.tries_remaining == 0

until (user_has_won || user_has_lost)

  puts game_board.display

  # Ask user to guess a letter

  puts "Please guess a letter: "
  guess = gets.chomp.upcase
  if game_board.letters_guessed.include?guess
    puts "You've already guessed that!"
  else
    game_board.letters_guessed << guess
    game_board.letters_guessed.sort!
    if game_board.word.include?guess
      game_board.add_letter(guess)
    else
      puts "Wrong!"
      game_board.tries_remaining -= 1
    end
  end

  user_has_won = !(game_board.blank.include?"_")
  user_has_lost = game_board.tries_remaining == 0
end

  # Check if this is a letter????

# Store the user input
  # CHeck array for guessed
  # If it's in array ask for another guess.
  # If not then store in array.
  #   check if guess is in word.
  #   Update screen accordingly.
  #     Add letter
  #     take flower away (tries).

# Loop ends:
  # If tries run out.
  #   Show a losing screed
  # Or if whole word is guessed.
  #   Show a winning screen.

if user_has_won
  puts game_board.display
  puts "You win!!!!"
end

if user_has_lost
  puts "Sorry! You lost :("
  puts "The word was #{game_board.word}!"
end

# Ask user if they want to play again.
#   if yes then loop to begining of Game
#   Or no then display a thank and goodbye.
