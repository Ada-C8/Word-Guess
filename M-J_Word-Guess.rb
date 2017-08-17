#Maria and Julia's Word Guess Game!


# NOUNS / CLASSES
# The Game
# receive a guess letter
# check guessed letter against array of target word and array of guess errors
# display array of wrong guessed letters
# display Word


# The Word Class
# select the target word from a preset array
# create an array of the word letters
class Word

def initialize (target_word)
  @target_word = target_word
end

end

# Points
# tallies the points / strings
# display art at the beginning of the game
# display the Art after every guess


puts "Welcome to Maria and Julia's Word Game!"

word_array = ["hat", "cat", "dog" ]
target_word = word_array.sample
#our_word = Word.new(target_word)
puts target_word
