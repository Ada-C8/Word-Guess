require_relative 'word'
require 'faker'
require 'colorize'

# User select level of difficulty
puts "

__          __           _
\\ \\        / /          | |
 \\ \\  /\\  / /__  _ __ __| |
  \\ \\/  \\/ / _ \\| '__/ _` |
   \\  /\\  / (_) | | | (_| |
    \\/  \\/ \\___/|_|  \\__,_|

         ______
        |___  /
            / / ___   _ _    __
           / / / _ \\|  __\\ / _ |
          / /__ (_) | | ||  __/
         /_____\\___/|_| |_|\\ \\\n\n"


puts "Welcome to Word Zone! You have 6 tries to guess a word or be booted out of the game.\n To unlock the secret token, you will have to complete all three levels.\n Select difficulty level:\n 1: Easy: Color, 2: Intermediate: Starwars Characters, 3: Hard: Superhero power!\n"
level = gets.chomp.to_i

  case level
  when 1
    word = Faker::Color.color_name
  when 2
    word = Faker::StarWars.character
  when 3
    word = Faker::Superhero.power
  end


word_guess = Word.new(word)
