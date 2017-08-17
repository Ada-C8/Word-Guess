# Word guess game - Kayla and Laura

class WordGuess
  attr_reader :game

  def initialize
    @game = game
  end

  def word_bank
    word_list = ["Accio", "Patronus", "Wand", "Hermione", "Snitch", "Dobby"]
    our_word = word_list.sample.upcase
    puts our_word
    #puts our_word.chars.each_slice(1).to_a

    puts "Welcome to our wonderful word guessing game! You have 10 tries to guess the word, one letter at a time!"
    print "Whats your first letter guess? (a through z): "
    letter = gets.chomp.upcase
    puts letter
    wrong_guess = []

    if our_word.include? letter
      puts "You guessed right!"
    else
      wrong_guess << letter
      puts "Try again!"
    end
  end

  # def ask_letter
  #   puts "Welcome to our wonderful word guessing game! You have 10 tries to guess the word, one letter at a time!"
  #   print "Whats your first letter guess? (a through z): "
  #   letter = gets.chomp.upcase
  #   puts letter
  #   wrong_guess = []
  #
  #   if our_word.include? letter
  #     puts "You guessed right!"
  #   else
  #     wrong_guess << letter
  #     puts "Try again!"
  #     puts wrong_guess
  #   end
  #
  #   # 1.times do ('a'..'z').include? letter
  #   #   #puts "true"
  #   # end
  # end


end





game = WordGuess.new
game.word_bank
