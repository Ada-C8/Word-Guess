require "random-word"
require "colorize"
require_relative 'cactus.rb'

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
    @gameboard = ""
    #@gameboard = Array.new(@word.length, "_")
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

  def generate_gameboard
    @gameboard = Array.new(@word.length, "_")
  end

  #start_game generates the word and the empty gameboard
  def start_game
    generate_word
    generate_gameboard
  end

  #gets a guess from the user and prompts them in a way appropriate to the
  #number of guesses they have already made
  def obtain_guess

    if @used_guesses.length > 1
      puts "\nYou have made these guesses: #{@used_guesses.join(" ")}".colorize(:white)
    elsif @used_guesses.length == 1
      puts "\nYou have already guessed: #{@used_guesses.join(" ")}".colorize(:white)
    end
    puts "\nPlease guess a letter".colorize(:white)

    loop do
      @current_guess = gets.chomp
      break if single_character? && is_a_letter? && already_guessed?
      puts "Woah woah woah. I only accept single letters that have not already been guessed. Try again.".colorize(:red)
    end
  end


  def single_character?
    return @current_guess.length == 1
  end

  def is_a_letter?
    return /[a-z]/.match(@current_guess)
  end

  def already_guessed?
    return !@used_guesses.include?(@current_guess)
  end
  #maybe the method to check the input is acceptable should go around here?


  #add_guesses takes the user's guess as input, then adds it to an array
  #containing all the letters that have been guessed.  It displays that array.
  def add_guess
    @used_guesses << @current_guess
    return @used_guesses
  end

  #update_gameboard: In the case of a correct guess, it add the guessed letter
  #to the gameboard.  In the case of an incorrect guess, it adds 1 to the
  #guess_count.  It then outputs the gameboard.
  def update_gameboard
    include_letter?
    if @guess_ind.length != 0
      puts "\n" + " " * 16 + "CORRECT!".colorize(:green)
      @guess_ind.each do |i|
        @gameboard[i] = @used_guesses[-1]
      end
    else
      puts "\n" + " " * 16 + "INCORRECT".colorize(:red)
      update_guess_count
    end
    output_gameboard
  end

  #output_gameboard flattens the gameboard array for better viewing
  def output_gameboard
    puts " " * 16 + @gameboard.join(" ").colorize(:white)
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
      puts "YOU WON!".colorize(:white)
      exit
    elsif @guess_count >= 6
      new_image = Cactus.new
      puts new_image.show_ascii(6)
      puts "You lost... the correct answer was\n".colorize(:white)
      puts " " * 16 + "#{@word.upcase.colorize(:white)} \n\n"
      exit
    end
  end

  #turn combines many of the methods in this class to encaspulate a single round
  #of the game
  def turn
    obtain_guess
    add_guess
    update_gameboard
    game_status
  end
end


# #
# d= WordClass.new
#
# d.start_game
# puts d.word
# d.output_gameboard
# # # puts d.add_guess("c")
# # # puts d.update_gameboard
# # # puts d.game_status
#
# 10.times do
#   puts d.turn
# end
# # end

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
