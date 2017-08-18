
## CLASS DEFINITIONS

class Word
  attr_reader :word_characters

  def initialize(given_word)
    @word_characters = []
    given_word.each_char {|c| @word_characters << c }
  end

end # end of Word class definition

class Display
  attr_accessor :display_word, :user_guess

  def initialize(game_instance)
    @string_word = game_instance.string_word
    @user_guess = game_instance.user_guess
    @display_word = ""
    # set initial word display
    @string_word.each_char do |char|
      if char == " "
        @display_word += "  "
      else
        @display_word += "_ "
      end
    end
  end

  #TODO ASCII / Tally

  def update_display
    char_positions =[]
    i = -1
    # push guessed character index to an array
    @string_word.each_char do |char|
      i += 1
      if char == @user_guess
        # times 2 to adjust for blanks in display_word
        char_positions.push(i * 2)
      end
    end
    # replace _ at those indices with the guessed character
    char_positions.each do |pos|
      @display_word[pos] = @user_guess
    end
  end

  def counter_update #race progession

  end

end # End of Display definition

class Game
  attr_reader :level, :word_to_guess, :string_word

  attr_accessor :user_guess, :interface

  def initialize
    # gets difficulty level from the user
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

    # choose a random sample from the selected level array
    case @level
    when "easy"
      @string_word = easy_words.sample
    when "medium"
      @string_word = med_words.sample
    when "hard"
      @string_word = hard_words.sample
    end
    # create a new Display for this game, pass the Game instance to it
    @interface = Display.new(self)
  end #End of Game initialization method

  #Validate User input
  def accept_guess
    puts "Phrase: " + @interface.display_word
    puts "Please enter a letter to guess:"
    @user_guess = gets.chomp.strip.downcase
    until /[a-z]+[[:blank]]*\b/.match(@user_guess) #&& guess != nil
      puts "Please enter alpha characters only:"
      @user_guess = gets.chomp.strip.downcase
    end
    @interface.user_guess = @user_guess
    check_guess
  end

  def check_guess
    #Accept Letter Guesses
    if @user_guess.length == 1
      if @string_word.include? (@user_guess)
        @interface.update_display
        accept_guess
      else
        puts "Nope!"
        #@interface.counter_update
        accept_guess
      end
    #Accept Word Guesses
    else
      if @user_guess == @string_word
        win_game
      else
        accept_guess
      end
    end


  end



  #Decide win or Lose
end # End of Game class definition

## EXECUTIES

game_1 = Game.new
game_1.accept_guess
