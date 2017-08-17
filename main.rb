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
require "Faker"

class Board

  attr_accessor :letters_guessed, :tries_remaining
  attr_reader :word, :blank

  def initialize(word)
    @word = word
    @blank = "_" * @word.length
    @letters_guessed = []
    @tries_remaining = 2
  end

  def display
    puts "@ " * @tries_remaining
    puts @blank
    puts "Letters Guessed: #{@letters_guessed.join(' ')}"
  end

  def add_letter(guess)
    letter_location = @word.index(guess)
    @blank[letter_location] = guess
  end
end

# Intro to user
puts "Welcome to The Star Wars Character Word Game!"

# selects difficulty ?
# word bank -
word_bank = ["ear", "heart"]
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

  while ((game_board.blank.include?"_") && (game_board.tries_remaining >= 0))
    game_board.display

    # Ask user to guess a letter

    puts "Please guess a letter: "
    guess = gets.chomp.upcase
    if game_board.letters_guessed.include?guess
      puts "You've already guessed that!"
    else
      game_board.letters_guessed << guess
      if game_board.word.include?guess
        game_board.add_letter(guess)
      else
        puts "Wrong!"
        game_board.tries_remaining -= 1
      end
    end

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

# Ask user if they want to play again.
#   if yes then loop to begining of Game
#   Or no then display a thank and goodbye.
