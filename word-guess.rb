
## CLASS DEFINITIONS

class Word
  attr_reader :word_characters

  def initialize(given_word)
    @word_characters = []
    given_word.each_char {|c| @word_characters << c }
  end

end # end of Word class definition

# class Letter
#   attr_accessor :visible, :positions
#   attr_reader :character
#
#   def initialize(letter, positions)
#     @character = letter
#     @visible = false
#     @positions = positions
#   end
#
#   def self.list
#     ObjectSpace.each_object(self) { |star| puts star.name }
#   end
#
# end # End of Letter class definition

class Display

  #TODO ASCII / Tally


  #TODO Word Display




end # End of Display definition

class Game
  attr_reader :level, :word_to_guess

  attr_accessor :user_guess
  #Select a Level
  def initialize

    puts "Welcome.."
    print "Choose a level (easy, medium, hard)"
    @level = gets.chomp.strip.downcase

    until @level == "easy" || @level == "medium" || @level == "hard"
      print "Please select a valid level (easy, medium, hard): "
      @level = gets.chomp.strip.downcase
    end

    #Pick A Word
    easy_words = ["pipes", "carets", "apple", "orange", "book", "computer"]
    med_words = ["esoteric", "consciousness", "illuminate", "discrepancy", "galactic"]
    hard_words = ["the meaning of life", "vibrational entity", "we are made of star stuff"]

    case @level
    when "easy"
      @word_to_guess = easy_words.sample
      @string_word = easy_words.sample
    when "medium"
      @word_to_guess = med_words.sample
      @string_word = med_words.sample
    when "hard"
      @word_to_guess = hard_words.sample
      @string_word = hard_words.sample
    end

    @word_to_guess =  Word.new(@word_to_guess)

  end #End of Game initialization method

  def accept_guess
    puts "Please enter a letter to guess:"
    guess = gets.chomp.strip.downcase
    until /[a-z]+[[:blank]]*\b/.match(guess) #&& guess != nil
      puts "Please enter alpha characters only:"
      guess = gets.chomp.strip.downcase
    end
    @user_guess = guess
    check_guess
  end

  def check_guess
    if @user_guess.length == 1
      if @string_word.include? (@user_guess)
        puts true
        accept_guess
      else
        puts "Nope!"
        accept_guess
      end
    else
       if @user_guess == @string_word
         win_game
       else
         accept_guess
    end
  end

  #Validate User input

  #Accept Letter Guesses
  # guess = gets.chomp
  # if guess.length = 1 #run Letter
  #
  # else # run Word
  #
  # end

  #Accept Word Guesses

  #Update Display

  #Decide win or Lose

end # End of Game class definition

game_1 = Game.new
puts game_1.word_to_guess
game_1.accept_guess
