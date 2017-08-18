require 'artii'
require_relative 'user_input'
require_relative 'random_word'
require_relative 'ascii_art'
require 'colorize'

penny = RandomWord.new
user = UserInput.new
cake = AsciiArt.new
# print penny.writes_underscore
# puts "random word array : #{penny.word}"
# print penny.underscore

# user.check_letter(penny, user)
# user.get_next_letter
# user.check_letter(penny, user)
# user.get_next_letter

# game greeting and instructions
puts "Welcome to Word-Guess!".colorize(:light_blue)
puts "=".colorize(:light_blue) * 22
puts "GAME INSTRUCTIONS:".colorize(:green)
puts "1.) Guess the word I'm thinking for a chance to have my Birthday Cake.".colorize(:yellow)
puts "2.) For every incorrect letter you choose, I will blow out one candle.".colorize(:yellow)
puts "3.) If you guess incorrectly 5 times, I will happliy keep my cake."
puts "READY...".colorize(:red)
puts "SET...".colorize(:red)

# loops until underscore array == random word || length of wrong_letters == 5
until penny.underscore == penny.word || user.wrong_letters.length == 5
  puts "Guess >> "

  # check user input letter
  user.check_letter(penny, user, cake)

  # checks for loser and exits game
  if user.wrong_letters.length == 5
    puts "YOU LOSE, I WIN"
  end
end

# checks for winner and outputs win message
if penny.underscore == penny.word
  puts "YOU WIN!!!. You can eat my birthday cake!".colorize(:blue)
  cake.show_cake
end
