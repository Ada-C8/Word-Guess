class UserInput
  attr_reader :current_letter,  :wrong_letters
  def initialize
    @current_letter = ""
    @wrong_letters = []
    @right_letters = []
  end

  def check_letter(random_word, user_input, cake)
    guess_display
    @current_letter = gets.chomp.downcase
    # checks that user input is actually a letter, makes them try again if not.
    until @current_letter =~ /[[:alpha:]]/
      puts "Invalid guess - please only guess one letter."
      return
    end
    # if user correctly guesses whole word, they win.
    if random_word.word.join == @current_letter
      random_word.rewrite_underscore(user_input)
      return
    # if random word array includes @current_letter
    elsif random_word.word.include?(@current_letter)
      if @right_letters.include?(@current_letter)
        puts "You've already tried that one, try something different!"
        return
      end
      @right_letters << @current_letter
      puts "Good job, keep guessin'"
      # replace underscore at that index with user_input(@current_letter)
      random_word.rewrite_underscore(user_input)
      return
    else
      if @wrong_letters.include?(@current_letter)
        puts "You've already tried that one, try something different!"
        return
      end
      @wrong_letters << @current_letter
      puts "WRONG, you loss a candle. Try Again".red
      cake.take_away_candle
      return
    end
  end

  # prints the already guessed letters
  def guess_display
    already_guessed = @wrong_letters + @right_letters
    already_guessed = already_guessed.join(', ')

    puts "You've already guessed: #{already_guessed}"
  end

end
