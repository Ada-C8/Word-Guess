require 'colorize'
#one class, methods


dictionary = ["pizza", "pasta", "tacos", "bologna", "salad"]

puts "Let's play a game!"


my_hangman = Hangman.new
my_hangman.choose_word(dictionary)
my_hangman.make_hidden_word
my_hangman.pick_a_letter
my_hangman.letter_included
