# Word guess game - Kayla and Laura

class WordGuess
  attr_reader :game

  def initialize
    @game = game
  end

  def word_bank
    tries = 10
    #word_list = ["Accio", "Patronus", "Wand", "Hermione", "Snitch", "Dobby"]
    our_word = 'DOBBY'
    #our_word = word_list.sample.upcase
    our_word_split = our_word.scan(/\w/).uniq.flatten.sort
    p our_word_split
    #puts our_word.chars.each_slice(1).to_a

    puts "Welcome to our wonderful word guessing game! You have 10 tries to guess the word, one letter at a time!"
    print "Whats your first letter guess? (a through z): "
    wrong_guess = []
    right_guess = []

    until tries == 0
      letter = gets.chomp.upcase

      if our_word.include? letter
        right_guess << letter
        right_guess = right_guess.uniq.flatten.sort
        puts "You guessed right!"
        p right_guess

        if right_guess == our_word_split
          puts "You WIN!"
          exit
        end

      else
        wrong_guess << letter
        puts "Try again!"
        p wrong_guess
        tries -= 1
      end
    end

    if tries == 0
      puts "Game over!"
      exit
    end

  end

end

game = WordGuess.new
game.word_bank
