require 'artii'
require_relative 'user_input'
require_relative 'random_word'

penny = RandomWord.new
charming = UserInput.new
print penny.writes_underscore
print penny.word

charming.check_letter(penny)
