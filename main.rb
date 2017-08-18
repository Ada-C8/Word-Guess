require_relative 'game'
require_relative 'word'

all_words = ["tiger", "cat", "dog", "turtle", "horse", "lyon", "fish"]

hangman_pics = ['''
  +---+
  |   |
      |
      |
      |
      |
=========''', '''
  +---+
  |   |
  O   |
      |
      |
      |
=========''', '''
  +---+
  |   |
  O   |
  |   |
      |
      |
=========''', '''
  +---+
  |   |
  O   |
 /|   |
      |
      |
=========''', '''
  +---+
  |   |
  O   |
 /|\  |
      |
      |
=========''', '''
  +---+
  |   |
  O   |
 /|\  |
 /    |
      |
=========''', '''
  +---+
  |   |
  O   |
 /|\  |
 / \  |
      |
=========''']

puts "WELCOME TO WORD GUESS!"
puts
puts "PRESS 1 TO START"

game_start = gets.chomp.to_i

while game_start == 1
  ###### NEW GAME STARTS HERE
  new_words = WORD.new(all_words)

  word = new_words.choose_word

  game = GAME.new(word, hangman_pics)
  # PRINTS UNDERSCORES
  game.underscore

  print game.display_ascii
  puts

  ####### LOOP UNTIL WORD IS COMPLETE OR IF TOTAL ERRORS = 6 #######
  until game.total_errors == 6 || game.current_guess.join == word
    # DISPLAY LETTERS IN ARRAY
    print game.show_letters
    puts
    # GET INPUT FROM USER
    puts "\nPlease guess a letter"
    input_letter = gets.chomp

    # MAKE SURE INPUT IS A LETTER
    until game.check_if_letter(input_letter)
      puts "Please enter a valid letter"
      input_letter = gets.chomp
    end
    # COUNTER FOR GAME ERRORS
    game.count_errors(input_letter)

    # MAKE SURE THAT THE LETTER WAS NOT GIVEN BEFORE
    no_repeated_letter = game.check_if_guessed(input_letter)

    # PUSHING ALL GUESSED LETTERS INTO AN ARRAY
    game.add_past_letters(no_repeated_letter)

    # REPLACE LETTERS
    game.replace_letters(no_repeated_letter)
    # DISPLAY ASCII
    print game.display_ascii
    puts
    puts game.past_letter.join.upcase
    puts
  end

  if game.total_errors == 6
    puts "YOU LOSE!"
    puts "THE WORD WAS ACTUALLY: #{word.upcase}"
    puts "PRESS 1 TO RESTART OR OTHER KEY TO ESCAPE"
    game_start = gets.chomp.to_i
  else
    puts "YOU WIN! \nTHE WORD WAS: #{word.upcase}"
    puts "PRESS 1 TO RESTART OR OTHER KEY TO ESCAPE"
    game_start = gets.chomp.to_i
  end
end
puts
puts "PLEASE COME BACK AGAIN!"
