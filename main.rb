require 'artii'
require_relative 'user_input'
require_relative 'random_word'

penny = RandomWord.new
user = UserInput.new
# print penny.writes_underscore
print penny.word
print penny.underscore

user.check_letter(penny, user)
print penny.underscore
user.get_next_letter
user.check_letter(penny, user)
# penny.rewrite_underscore(user)
