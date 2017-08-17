require 'faker'
require 'pp'
class RandomWord
  attr_accessor :guess
  attr_reader  :word_display

  def initialize
    @word = "#{Faker::Overwatch.unique.hero}"
    @letters = @word.split('')
    @guess = 0
    puts "Welcome to Word Guess!  Let me think of a word first..... ok got it"
    puts "You can guess wrong 5 times until the cat eats you"
    @word_display = []
    @letters.length.times do
      @word_display << "_"
    end
    cat_position
  end

  def letter_index(user_letter)
    letter_indeces =[]
    @letters.length.times do |i|
      if @letters[i] == user_letter
        letter_indeces << i
      end
    end
    return letter_indeces
  end

  def update_display(letter_indeces)
    letter_indeces.each do |index|
      @word_display[index] = @letters[index]
    end
    puts @word_display
  end

  def cat_position
    cat = ":3"
#   case @guess
#   when 0
#     cat = # <<CAT0
#     "/ᐠ.ꞈ.ᐟ\"
# # CAT0
#   when 1
#     cat = <<CAT1
#           /ᐠ=ᆽ=ᐟ \
# CAT1
#   when 2
#     cat = <<CAT2
#                     /ᐠ –ꞈ –ᐟ\
# CAT2
#   when 3
#     cat = <<CAT3
#                               /ᐠ・ᆽ・ᐟ \
# CAT3
#   when 4
#     cat = <<CAT4
#
#                                           (=✖ᆽ✖=)
# CAT4
#   when 5
#     cat = <<CAT5
#                                                   *:･ﾟ✧(=✪ ᆺ ✪=)*:･ﾟ✧
# CAT5
#   end
  puts cat * (@guess)
  end

end # end random_word class


random_word = RandomWord.new

pp random_word.word_display #write pretty print method

until random_word.guess == 5
  puts "guess one letter"
  user_input = gets.chomp
  # refactor into a method
  until user_input.length == 1 && user_input.to_i == 0
    user_input = gets.chomp
  end
  indeces = random_word.letter_index(user_input)
  if indeces.length > 0
    puts "nice"
    random_word.update_display(indeces)
  else
    puts "yikes"
    random_word.guess += 1
  random_word.cat_position
  end
end
