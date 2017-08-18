require 'artii'

class Hangman
  attr_accessor :guesses, :word, :hidden_word, :wrongs

  def initialize
    @guesses = []
    @word = "" #pick word random from dictionary
    @hidden_word = []
    @wrongs = 0
    @fails = 0
  end

  def make_hidden_word
    @word.length.times do @hidden_word << "____  "
    end

  end

  def choose_word(dictionary)
    @word = dictionary.sample.upcase
  end

  def replace_hidden_with_letter(letter)
    word_index =(0 ... @word.length).find_all {|i| @word[i,1] == letter}
    num_letters = word_index.length

    num_letters.times do |this|
      @hidden_word[word_index[this]] = letter
    end
  end


  def letter_included(guess)
    if @word.include?(guess)
      puts "Good Guess"
      # add letter to hidden_word
      replace_hidden_with_letter(guess)
      #################
      @hidden_word
    else # ascii minus something
      @fails += 1
    end
  end # End letter_included


  def pick_a_letter

    while @word.split("") != @hidden_word

      puts "pick a letter"
      letter_guess = gets.chomp.capitalize

      case
      when !!(letter_guess =~ /[A-Z]/) && !@guesses.include?(letter_guess)
        @guesses << letter_guess
        letter_included(letter_guess)
        lose = "   _____                          __     __           _
        / ____|                         \ \   / /          | |
        | (___   ___  _ __ _ __ _   _     \ \_/ /__  _   _  | |     ___  ___  ___
        \___ \ / _ \| '__| '__| | | |     \   / _ \| | | | | |    / _ \/ __|/ _ \
        ____) | (_) | |  | |  | |_| |_     | | (_) | |_| | | |____ (_) \__ \  __/_
        |_____/ \___/|_|  |_|   \__, ( )    |_|\___/ \__,_| |______\___/|___/\___(_)
        __/ |/
        |___/
        "
        case
        when @word.split("") == @hidden_word
          puts "You win!"
        when @fails == 1
          #ascii 1
        when @fails == 2
          #ascii 2
        when @fails == 3
          #ascii 3
        when @fails == 4
          # ascii 4
        when @fails == 5
          # ascii 5
        when @fails == 6
          puts lose
          # ascii 6
          exit
        else #no fails yet
        end
        puts "#{hidden_word}"
      else
        puts "No, pick another letter."
      end
      # guesses << pick_a_letter
      # letter_included(letter_guess)
    end
  end

end # End of Hangman
