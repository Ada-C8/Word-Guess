class RandomWord
  attr_reader :word
  def initialize()
    word_arr = ["envelopea", "cat", "dragon", "coffeea", "water", "pencila"]
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
