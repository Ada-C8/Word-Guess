require 'faker'
require 'pp'
require 'pry'
class RandomWord
  attr_accessor :guess, :guessed_letters
  attr_reader  :word_display

  def initialize
    @word = Faker::Overwatch.unique.hero.upcase
    @letters = @word.split('')
    @guess = 0
    @word_display = []
    @letters.length.times do
      @word_display << "_"
    end
    cat_position
    welcome_screen
    @guessed_letters = []
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
    #puts @word_display
    pretty_print
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
  def did_you_win?
    return !@word_display.include?("_")
  end

  def pretty_print
    @word_display.each do |letter|
      print "#{letter} "
    end
    puts ""
  end
end # end random_word class

def check_input(input,letter_array)
  input.gsub!(/[^0-9A-Za-z]/, '')
  until input.length == 1 && input.to_i == 0 && input != "0"
      print "Please enter a letter: "
      input = gets.chomp.upcase
      input.gsub!(/[^0-9A-Za-z]/, '')
  end
  if letter_array.include?(input)
    puts "You have already guessed this letter"
    print "Please try again: "
    input = check_input(gets.chomp.upcase, letter_array)
    # input.gsub!(/[^0-9A-Za-z]/, '')
  end
  return input
end

def welcome_screen
  puts "Welcome to Word Guess!  Let me think of a word first..... ok got it"
  puts "You can guess wrong 5 times until the cat eats you"
end

random_word = RandomWord.new

random_word.pretty_print #write pretty print method

until random_word.guess == 5
  print "Guess one letter: "
  user_input = check_input(gets.chomp.upcase,random_word.guessed_letters)
  random_word.guessed_letters << user_input
  indeces = random_word.letter_index(user_input)
  #binding.pry
  if indeces.length > 0
    puts "nice"
    random_word.update_display(indeces)
  else
    puts "yikes"
    random_word.guess += 1
  random_word.cat_position
  end
  system "clear"
  welcome_screen
  random_word.cat_position
  random_word.pretty_print
  if random_word.did_you_win?
    puts "Congrats! You survived"
    exit
  end
end

puts "Sorry you have failed at this game..."
puts "Cat is very disappointed :("
