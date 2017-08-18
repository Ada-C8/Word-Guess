require 'colorize'
require 'faker'
#require 'letter'

class Word
  attr_accessor :word

  def initialize(word)
    @word = word.upcase.split("")
    @total_guesses = 0
    @correct_guesses = 0 # compare to word length
    @wrong_guesses = 0 # count down
    #create array of all the blank spaces
    @dash_array = []
      @word.each do |char|
        if char == " "
          @dash_array.push("  ")
        else
          @dash_array.push("_ ")
        end
      end
      puts "Can you guess this word?"
      puts @dash_array.join
      @previous_guesses = []
      track_guesses
  end

  # user input
  def track_guesses
    until @wrong_guesses == 6 || @word == @dash_array
      print "Guess a letter:"
      @guess = gets.chomp.upcase!
 #check if user enters the same guess more than once
      if @previous_guesses.include?(@guess) == false
        @previous_guesses.push(@guess)
        puts "Previous guess #{@previous_guesses}"
        check_guess(@guess)
      else
        puts "You already picked that letter."
      end

      if @wrong_guesses == 6
        puts "GAME OVER."
        puts "The words is #{@word.join}"
      exit
      end
      if @word == @dash_array
        puts "Way to go!!  The word is #{@dash_array.join}!!"
        exit
      end
    end
  end

# track number of correct and wrong guesses
  def check_guess(guess)
      if @word.include?(guess)
        if !@dash_array.include?(@guess)
          puts "Great! #{guess} is a match!"
          @correct_guesses += 1
          replace_letter
        end
      else
        puts "Try again"
        @wrong_guesses += 1
        ascii_change
      end
        @total_guesses += 1
        puts @dash_array.join
  end

  def replace_letter
    @word.length.times do |i|
      if @guess == @word[i]
        @dash_array[i] = @guess
      end
    end
  end
end

def ascii_change
  case @wrong_guesses
  when 1
    puts ("|").colorize(:green)

  when 2
    puts ("
            | | ").colorize(:red)

  when 3
    puts ("
            | |
            | |     ___  ___  ___ _ ").colorize(:red)

  when 4
    puts ("
            | |
            | |     ___  ___  ___ _ __
            | |    / _ \/ __|/ _ \ '__|").colorize(:red)

  when 5
  puts ("
          | |
          | |     ___  ___  ___ _ __
          | |    / _ \/ __|/ _ \ '__|
          | |____ (_) \__ \  __/ |").colorize(:blue)

  when 6
  puts    ("
           | |
           | |     ___  ___  ___ _ __
           | |    / _ \/ __|/ _ \ '__|
           | |____ (_) \__ \  __/ |
           |______\___/|___/\___|_|").colorize(:red).blink
  end
end

# random = ["cat", "dog", "frog", "horse", "bird", "monkey", "pidgeon", "mouse", "rabbit", "lama"].sample

# User select level of difficulty
puts "

__          __           _
\ \        / /          | |
 \ \  /\  / /__  _ __ __| |
  \ \/  \/ / _ \| '__/ _` |
   \  /\  / (_) | | | (_| |
    \/  \/ \___/|_|  \__,_|

        ______
        |___  /
             / / ___  _ __   ___
            / / / _ \| '_ \ / _ \
           / /__ (_) | | | |  __/
         /_____\___/|_| |_|\___|"


puts "Welcome to Word Zone! You have 6 tries to guess a word or be booted out of the game.  To unlock the secret token, you will have to complete all three levels.\n Select difficulty level:  1: Easy,  2: Intermediate, 3: Hard!"
level = gets.chomp.to_i

  case level
  when 1
    word = Faker::Color.color_name
  when 2
    word = Faker::StarWars.character
  when 3
    word = Faker::Superhero.power
  end


word_guess = Word.new(word)
