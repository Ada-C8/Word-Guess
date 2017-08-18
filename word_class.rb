require "random-word"

class WordClass
  attr_reader :word, :gameboard, :used_guesses, :guess_count


  #instance_variables
  # word
  # letters that have been guessed
  # gameboard
  # number of guesses



  #guess

  #private methods

  # update record of what has been guessed
  # update gameboard
  # display what has been guessed
  # is gameboard complete?
  # generate word

  def initialize
    @word = ""
    @gameboard = Array.new(@word.length, "_")
    @guess_count = 0
    @used_guesses = []
    @guess_ind = []
    @current_guess =""
  end

  #generate_word uses RandomWord gem to create a random english word of between
  #4 and 8 characters.  It excludes words that have "-" and "_" as characters.
  def generate_word
    @word = RandomWord.nouns(not_shorter_than: 4, not_longer_than: 8).next
    while @word.include?("_") || word.include?("-")
      @word = RandomWord.nouns(not_shorter_than: 4, not_longer_than: 8).next
    end
    return @word
  end

  #gets a guess from the user
  def obtain_guess
    puts "Guess a letter, any letter."
    @current_guess = gets.chomp
    return @current_guess
  end

  #add_guesses takes the user's guess as input, then adds it to an array
  #containing all the letters that have been guessed.  It displays that array.
  def add_guess
    @used_guesses << @current_guess
    puts "guess count #{@guess_count}"
    puts "You have made these guesses #{@used_guesses.join}"
  end

  #update_gameboard: In the case of a correct guess, it add the guessed letter
  #to the gameboard.  In the case of an incorrect guess, it adds 1 to the
  #guess_count.  It then outputs the gameboard.
  def update_gameboard
    include_letter?
    if @guess_ind.length != 0
      @guess_ind.each do |i|
        @gameboard[i] = @used_guesses[-1]
      end
    else
      update_guess_count
    end
    output_gameboard
  end

  #output_gameboard flattens the gameboard array for better viewing
  def output_gameboard
    puts @gameboard.join(" ")
  end

  #include_letter? returns an array with the index of all instances of the
  #guessed letter.
  def include_letter?
    @guess_ind = (0 ... @word.length).find_all { |i| @word[i,1] == @used_guesses[-1]}
    return @guess_ind
  end

  #gameboard_complete checks if the game has been won (there are no blanks left)
  def gameboard_complete
    !@gameboard.include?("_")
  end

  #update_guess_count adds 1 to the guess_count
  def update_guess_count
    @guess_count += 1
  end

  #game_status checks if the game has been won, lost, or is still ongoing.
  #if the game has been won, or lost, the game exits, otherwise it keeps going.
  def game_status
    if  gameboard_complete
      puts "You won!"
      exit
    elsif @guess_count < 5 && !gameboard_complete
      puts "Please enter another guess"
    elsif @guess_count >= 5
      puts "You lost... the correct answer was"
      puts @word.upcase
      exit
    end
  end

  #turn combines many of the methods in this class to encaspulate a single round
  #of the game
  def turn
    puts obtain_guess
    puts add_guess
    puts update_gameboard
    puts game_status
  end
end


#
# d= WordClass.new("cactus")
#
# puts d.generate_word
# puts d.output_gameboard
# # puts d.add_guess("c")
# # puts d.update_gameboard
# # puts d.game_status
#
# 10.times do
#   puts d.turn
# end

# puts d.add_guess("a")
# puts d.update_gameboard
# puts d.game_status
#
# puts d.add_guess("b")
# puts d.update_gameboard
# puts d.game_status
#
# puts d.add_guess("j")
# puts d.update_gameboard
# puts d.game_status
#
# puts d.add_guess("w")
# puts d.update_gameboard
# puts d.game_status
#
# puts d.add_guess("o")
# puts d.update_gameboard
# puts d.game_status
