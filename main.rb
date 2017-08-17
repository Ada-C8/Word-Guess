require 'artii'
require_relative 'user_input'
require_relative 'random_word'
require_relative 'ascii_art'

penny = RandomWord.new
user = UserInput.new
cake = AsciiArt.new
# print penny.writes_underscore
puts "random word array : #{penny.word}"
# print penny.underscore

# user.check_letter(penny, user)
# user.get_next_letter
# user.check_letter(penny, user)
# user.get_next_letter

until penny.underscore == penny.word
  puts ">> " # for testing
  user.check_letter(penny, user, cake)
  # if penny.underscore == penny.word
  #   return
  # end
  # user.get_next_letter
end







#penny.rewrite_underscore(user)
