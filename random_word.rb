class RandomWord
  attr_reader :word, :underscore
  def initialize()
    word_arr = ["envelopea", "cat", "dragon", "coffeea", "water", "pencila"]
    @word = word_arr[rand(word_arr.length)].split('')
    @length = @word.length
    @underscore = ("_  " * @length).split('  ')
  end
  #
  # def writes_underscore
  #   underscore = "_  " * @length
  #   @underscore = underscore.split('  ')
  # end

  def rewrite_underscore(user_input)
    # find index of letter of random word
    i = @word.index(user_input.current_letter)
    # replace underscore with right letter
    @underscore[i] = user_input.current_letter
    # print @underscore

  end

end
