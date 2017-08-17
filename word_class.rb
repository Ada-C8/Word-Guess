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
  end

  def include_letter?(input)
    gues_ind = (0 ... @word.length).find_all { |i| @word[i,1] == input}
    return gues_ind
  end

end


d= WordClass.new("cactus")

puts d.word
puts d.gameboard
puts d.include_letter?("c")
