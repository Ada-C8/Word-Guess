require 'faker'
require 'pp'
require 'pry'
require './cat_ascii.rb'
require 'colorize'

class RandomWord
  attr_accessor :guess, :guessed_letters
  attr_reader  :word_display, :word

  def initialize(level)
    case level
    when "heroes"
      @word = Faker::Overwatch.unique.hero.upcase
    when "locations"
      @word = Faker::Overwatch.unique.location.upcase
    when "quotes"
      @word = Faker::Overwatch.unique.quote.upcase
    end
    @letters = @word.split('')
    @guess = 0
    @word_display = []
    @letters.each do |letter|
      if [" ","!",",",".","?","\"","'",":",";","$"].include?(letter)
        @word_display << letter
      else
        @word_display << "_"
      end
    end
    cat_position
    @guessed_letters = []
  end

  def letter_index(user_letter)
    letter_indeces =[]
    if user_letter.length > 1
      if user_letter == @word.gsub(/[^0-9A-Za-z]/, '')
        you_win
        letter_indeces = (0...@letters.length).to_a
      end
    else
      @letters.length.times do |i|
        if @letters[i] == user_letter
          letter_indeces << i
        end
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
    case @guess
    when 0
      puts cat_0.colorize(:green)
    when 1
      puts cat_1.colorize(:light_green)
    when 2
      puts cat_2.colorize(:yellow)
    when 3
      puts cat_3.colorize(:magenta)
    when 4
      puts cat_4.colorize(:light_red)
    when 5
      puts cat_5.colorize(:red)
    end
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

  def secret_word
    puts "Sorry you have failed at this game..."
    puts "Cat thinks you are very delicious."
    puts "The answer was \"#{@word}\""
  end

  def you_win
    puts "Congrats! You survived"
    puts "The answer was \"#{@word}\""
  end


end # end random_word class

def check_input(input,letter_array)
  input.gsub!(/[^0-9A-Za-z]/, '')
  until input.to_i == 0 && input != "0" && input != ""
    print "Please enter a letter: "
    input = gets.chomp.upcase
    input.gsub!(/[^0-9A-Za-z]/, '')
  end
  if letter_array.include?(input)
    puts "You have already guessed this letter"
    print "Please try again: "
    input = check_input(gets.chomp.upcase, letter_array)
  end
  return input
end

def welcome_screen
  puts "Welcome to Word Guess!  Let me think of a word first..... ok got it"
  puts "You can guess wrong 5 times until the cat eats you"
end

play_again = true

while play_again

  puts "Hey......do you know Overwatch heroes, locations or quotes best?"
  user_level = gets.chomp
  until ["heroes", "locations", "quotes"].include? user_level
    puts "Valid inputs: heroes, locations, quotes"
    user_level = gets.chomp
  end
  system "clear"
  welcome_screen
  random_word = RandomWord.new(user_level)

  random_word.pretty_print
  player_win = false
  while random_word.guess < 5 && !player_win
    print "Guess one letter: "
    user_input = check_input(gets.chomp.upcase,random_word.guessed_letters)
    random_word.guessed_letters << user_input
    indeces = random_word.letter_index(user_input)
    if indeces.length > 0
      random_word.update_display(indeces)
    else
      random_word.guess += 1
    end
    system "clear"
    welcome_screen
    random_word.cat_position
    random_word.pretty_print
    if random_word.did_you_win?
      random_word.you_win
      player_win = true
    end
  end
if !random_word.did_you_win?
  random_word.secret_word
end
  print "Would you like to play again? "
  user = gets.chomp
  if user == "yes"
    play_again = true
  else
    play_again = false
  end
end
