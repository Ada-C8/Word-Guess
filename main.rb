require 'artii'
require_relative 'user_input'
require_relative 'random_word'
require_relative 'ascii_art'
require 'colorize'

penny = RandomWord.new
user = UserInput.new
cake = AsciiArt.new

# game greeting and instructions
puts "Welcome to Word-Guess!".blue
puts "=".blue * 22
puts "GAME INSTRUCTIONS:".colorize(:green)
puts "1.) Guess the word I'm thinking for a chance to have my Birthday Cake.".green
puts "2.) For every incorrect letter you choose, I will blow out one candle.".green
puts "3.) If you guess incorrectly 5 times, you lose and I will happliy keep my cake.".green
puts "READY...".red
puts "SET...".red

# loops until underscore array == random word || length of wrong_letters == 5
until penny.underscore == penny.word || user.wrong_letters.length == 5
  puts "Guess >> ".green

  # check user input letter
  user.check_letter(penny, user, cake)

  # checks for loser and exits game
  if user.wrong_letters.length == 5
    puts
    puts "=".colorize(:light_blue) * 16
    puts "YOU LOSE, I WIN!".blue
  end
end

# checks for winner and outputs win message
if penny.underscore == penny.word
  puts "YOU WIN!!!. You can eat my birthday cake!".green
  cake.show_cake
end
