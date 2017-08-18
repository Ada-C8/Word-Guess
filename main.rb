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
puts "2.) For every incorrect letter you choose, I will blow out one candle. You have 5 chances to guess.".colorize(:yellow)
puts "READY...".colorize(:red)
puts "SET...".colorize(:red)
puts "GUESS!!".colorize(:red)

until penny.underscore == penny.word
  puts "Guess >> "

  user.check_letter(penny, user, cake)

  # if penny.underscore == penny.word
  #   return
  # end
  # user.get_next_letter
end

if penny.underscore == penny.word
  puts "YOU WIN!!!. You can eat my birthday cake!".colorize(:blue)
  cake.show_cake
end


if user.wrong_letters.length == penny.word
  puts "YOU LOSE, I WIN"
end



#penny.rewrite_underscore(user)
