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

  def initialize(word)
    @word = word.downcase
    @gameboard = Array.new(@word.length, "_")
    @guess_count = 0
    @used_guesses = []
    @guess_ind = []
  end

  def generate_word
    @word = RandomWord.nouns(not_shorter_than: 4, not_longer_than: 8).next
    while @word.include?("_") || word.include?("-")
      @word = RandomWord.nouns(not_shorter_than: 4, not_longer_than: 8).next
    end
    return @word
  end

  def add_guess(new_guess)
    @used_guesses << new_guess
    puts "guess count #{@guess_count}"
    puts "You have made these guesses #{show_guesses}"
  end

  def show_guesses
    return @used_guesses.join
  end

  def output_gameboard
    puts @gameboard.join(" ")
  end

  def update_gameboard
    include_letter?
    if @guess_ind.length != 0
      @guess_ind.each do |i|
        @gameboard[i] = @used_guesses[-1]
      end
      update_guess_count
    end
    output_gameboard
  end

  def include_letter?
    @guess_ind = (0 ... @word.length).find_all { |i| @word[i,1] == @used_guesses[-1]}
    return @guess_ind
  end

  def gameboard_complete
    !@gameboard.include?("_")
  end

  def update_guess_count
    @guess_count += 1
  end

  def game_status
    if  gameboard_complete
      puts "You won"
    elsif @guess_count < 5 && !gameboard_complete
      puts "Please enter another guess"
    elsif @guess_count >= 5
      puts "You lost"
      exit
    end
  end

  def turn(input)
    puts add_guess(input)
    puts update_gameboard
    puts game_status
  end


end



d= WordClass.new("cactus")

puts d.generate_word
puts d.output_gameboard
# puts d.add_guess("c")
# puts d.update_gameboard
# puts d.game_status

puts d.turn("c")
puts d.turn("g")
puts d.turn("a")

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
