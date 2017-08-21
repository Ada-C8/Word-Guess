class Game
  def initialize(game_word)
    # array, contains the final secret answer in an array, one letter per index position
    @letter_array = game_word.downcase.split("")

    # array, contains the answer as guessed thus far, with "_" where guesses remain
    @finished_guess = game_word.gsub(/./, "_").split("")

    # array, contain every letter guessed thus far that isn't in the final secret answer
    @guessed_letters = []

    # counts how many guesses have been made and aren't correct
    @failed_guesses = 0
  end

  def hangmanpics
    hangmanpics = ['''
    +---+
    |   |
        |
        |
        |
        |
    =========''', '''
    +---+
    |   |
    O   |
        |
        |
        |
    =========''', '''
    +---+
    |   |
    O   |
    |   |
        |
        |
    =========''', '''
    +---+
    |   |
    O   |
   /|   |
        |
        |
    =========''', '''
    +---+
    |   |
    O   |
   /|\  |
        |
        |
    =========''', '''
    +---+
    |   |
    O   |
   /|\  |
   /    |
        |
    =========''', '''
    +---+
    |   |
    O   |
    /|\  |
    / \  |
        |
    =========''']
  end

  # begins the game, call only once after instantiating Game object
  def startGame
    puts "WELCOME TO HANGMAN!"
    promptUser
  end


  # prompts the user for a new letter, call this each time you need to start over and ask for a new letter
  def promptUser
    # moved the below unless statement to the top of the promtuser method because the promtuser and hangmanpics on lines 124-126 were preventing the user from being reach the portion of code that prints "you win"
    unless (@finished_guess.include?("_"))
      puts "\nYou win, the answer is: #{@letter_array.join("")}"
      return
    end

    # Get guess from user
    puts "What's your guess?"
    guess = gets.chomp.downcase

    # Tell user what they've guessed thus far
    puts "You've guessed: #{@guessed_letters.join(', ')}"
    # puts "So far: #{@finished_guess.join('-')}"

    # validate the guess is a letter and only one letter
    if (guess.length > 1)
      puts "You can only guess one letter at a time"
      return promptUser
    end
    unless (guess.match(/[a-zA-Z]/))
      puts "Your guess must be a letter"
      return promptUser
    end

    # check to see if this letter has already been guessed
    if (@guessed_letters.include?(guess))
      puts "You already guessed #{guess}"
      return promptUser
      hangmanpics
    end

    # now we know this is a new valid letter that has not been guessed, so add it to list of guessed letters
    @guessed_letters.push(guess)

    # check to see if the guess actually exists in the final secret answer
    if (@letter_array.include?(guess)) # this means the guess is a correct guess
      # loop through every character in the secret answer, and where it matches the guess, replace the "_" in the @finished_guess
      0.upto(@letter_array.length-1) { |index|
        if (@letter_array[index] == guess)
          @finished_guess[index] = guess
        end
      }

      #by puting the following three lines of code outside of the above loop inside of the if statment, we are allowing the loop to go through each index rather than stopping at the first matching letter and accounting for duplicate letters in a word.
      puts "So far: #{@finished_guess.join('-')}"
      promptUser
      hangmanpics

      # if the finished_guess has no more "_", then we know they win!
      # unless (@finished_guess.include?("_"))
      #   puts "You win, the answer is: #{@letter_array.join("")}"
      #   return
      # end
    else # else the guess was incorrect
      # add to the count of failed guesses
      puts "So far: #{@finished_guess.join('-')}"
      @failed_guesses += 1
      if (@failed_guesses == 7) # after 7 failed guesses you lose!
        puts "You lose!"
        return
      else
        # print the new hangman drawing based on your failed guess, and then ask again
        puts hangmanpics[@failed_guesses-1]
        return promptUser
      end
    end
  end
end

gamewords = ["Elephant","Rhinoceros","Puppy","Giraffe","Lion","Anteater"]

myGame = Game.new(gamewords.sample)
myGame.startGame
