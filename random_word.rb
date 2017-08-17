class RandomWord
  attr_reader :word
  def initialize()
    word_arr = ["envelope", "cat", "dragon", "coffee", "water", "pencil"]
    @word = word_arr[rand(word_arr.length)].split('')
    @length = @word.length
  end

  def writes_underscore
    underscore = "_  " * @length
    return underscore.split('  ')
  end

  def reprint

  end

end
