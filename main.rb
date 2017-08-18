require_relative "word.rb"
require_relative "explosive.rb"

class User

#
  attr_reader :letter, :correct_guesses, :dashes, :guesses

  # ask user for a letter guess
  #store letter guess in a variable
  #check variable against the array of string letters

  # initialize instances with word and image
  # calling word and image class
  # necessary setup for game function
  def initialize(word, image)
    @word = word
    @correct_guesses = Array.new(word.game_word.length)
    @dashes = Array.new(word.game_word.length, "-")
    @guesses = []
    @counter = 0
    @image = image
  end

  def user_input
    #loop to confirm user has included a new guess
    # if new guess, added to guess array
    loop do
      puts "#{correct_guesses.join(" ")}"
      puts "#{dashes.join(" ")}"
      puts "Guesses: #{@guesses.join(" ")}"
      puts "Guess a letter."
      @letter = gets.chomp.downcase
      if @guesses.include?(@letter)
        puts "please provide a new letter "
      else
        @guesses << @letter
        break
      end
    end

# confirm if guess is right or wrong with user messages
    if @word.game_word.include?(@letter)
      puts right_guess
      index_array = @word.game_word.each_index.select{|i| @word.game_word[i] == @letter}
      index_array.each do |i|
        @correct_guesses[i] = @letter
        if @correct_guesses == @word.game_word
          puts "#{correct_guesses.join(" ")}"
          puts "#{dashes.join(" ")}"
          puts "You've won! You live another day :)"
          puts "#{@image.bombs.last}"
          exit
        end
      end

    else
      puts wrong_guess
      puts @image.bombs[@counter]
      @counter += 1
        if @counter >= 8
          puts "what a shame! You lost this time!"
          puts "The word was #{@word.game_word.join}"
          exit
        end
    end
  end

# right/wrong guess messages
  def right_guess
    puts "You guessed right! Wingardium leviosa!"
  end

  def wrong_guess
    puts "Wrong guess. You must be up to no good..."
  end
end

#setup player instance
new_game = Word.new
images = Image.new
player = User.new(new_game, images)

#commenting this next line out to play game without knowing word
###uncomment following line to test! ###
# puts "This is the game word: #{new_game.game_word}"
player.user_input

# keep playing until correct guess array is filled
# or player loses (condition created in user input method)
while player.correct_guesses.include?(nil)
  player.user_input
end
