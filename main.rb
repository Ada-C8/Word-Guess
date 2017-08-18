require 'word'

# User select level of difficulty
puts "

__          __           _
\ \        / /          | |
 \ \  /\  / /__  _ __ __| |
  \ \/  \/ / _ \| '__/ _` |
   \  /\  / (_) | | | (_| |
    \/  \/ \___/|_|  \__,_|

        ______
        |___  /
             / / ___  _ __   ___
            / / / _ \| '_ \ / _ \
           / /__ (_) | | | |  __/
         /_____\___/|_| |_|\___|"


puts "Welcome to Word Zone! You have 6 tries to guess a word or be booted out of the game.  To unlock the secret token, you will have to complete all three levels.\n Select difficulty level:  1: Easy(Color),  2: Intermediate(Starwars characters), 3: Hard(Superhero powers)!"
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
