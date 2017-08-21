class Guess
  attr_accessor :user_guess

  def valid?(user_guess)
    /[a-z]+[[:blank]]*\b/.match(user_guess) ? true : false
  end

  def correct?(user_guess)
    @user_guess.length == 1 && @string_word.include?(@user_guess) ? true : false
  end

  def end_game?

  end
end

guess = Guess.new

puts guess.valid?("4737nd8d9")



#Accept Letter Guesses

# this goes in game
 #if @user_guess == @string_word
 #  @interface.display_word.gsub!("_", "-")
 #  end_game?
 #elsif @used_letters.include?(@user_guess)
 #  puts "You already guessed that"
 #elsif @user_guess.correct?
 # update_display
 # used_letters << @user_guess
 # else
 #   puts "Nope!"
 #   update_counter
 #   end_game?

    @interface.update_display
    end_game
  else
    if @used_letters.include?(@user_guess)
      puts "You already tried #{@user_guess}. Try again"
      end_game
    else
      puts "Nope!"
      @used_letters << @user_guess
      @interface.update_counter
      end_game
    end
  end
#Accept Word Guesses
else

  else
    if @used_letters.include?(@user_guess)
      puts "You already tried #{@user_guess}. Try again"
      end_game
    else
      puts "Wrong!"
      @used_letters << @user_guess
      @interface.update_counter
      end_game
    end
  end
end
end
