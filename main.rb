require 'artii'
require_relative 'user_input'
require_relative 'random_word'

penny = RandomWord.new
charming = UserInput.new
# print penny.writes_underscore
print penny.word
print penny.underscore

charming.check_letter(penny)

penny.reprint(charming)
