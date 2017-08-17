class WordClass
  attr_reader :word, :gameboard


  #instance_variables
  # word
  # letters that have been guessed
  # gameboard
  # number of guesses

  # public method

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
    @number_of_guesses = 0
    @used_guesses = []
    @guess_ind = []
  end

  def add_guess(new_guess)
    @used_guesses << new_guess
  end

  def output_gameboard
    puts @gameboard.join(" ")
  end

  def update_gameboard
    if @guess_ind.length != 0
      @guess_ind.each do |i|
        @gameboard[i] = @used_guesses[-1]
      end
    end
  end

  def include_letter?
    @guess_ind = (0 ... @word.length).find_all { |i| @word[i,1] == @used_guesses[-1]}

    return @guess_ind
  end

end


d= WordClass.new("cactus")

puts d.word
puts d.gameboard
puts d.add_guess("c")
puts d.include_letter?
puts d.output_gameboard
puts d.update_gameboard
puts d.output_gameboard
