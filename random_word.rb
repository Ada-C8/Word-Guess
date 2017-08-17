class RandomWord
  def initialize()
    word_arr = ["envelope", "cat", "dragon", "coffee", "water", "pencil"]
    @word = word_arr[rand(word_arr.length)]
    @length = @word.length
  end

  def writes_underscore()
    underscore = "_  " * @length
    return underscore
  end

end

penny = RandomWord.new
puts penny.writes_underscore
