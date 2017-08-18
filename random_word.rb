class RandomWord
  attr_reader :word, :underscore

  def initialize()
    # word_arr = ["envelope", "cat", "dragon", "coffee", "water", "pencil"]
    # @word = word_arr[rand(word_arr.length)].split('')
    @word = RandomWordGenerator.of_length(5).split('')
    @length = @word.length
    @underscore = ("_  " * @length).split('  ')
  end


  def rewrite_underscore(user_input)
    # if user correctly guesses whole world, they win.
    if @word.join == user_input.current_letter
      arr = user_input.current_letter.split('')
      arr.length.times do |i|
        @underscore[i] = arr[i]
      end

    else
      # find index(es) of letter(s) of random word
      arr = @word.each_index.select{|n| @word[n] == user_input.current_letter}
      # replace underscore with right letter
      arr.each do |i|
        @underscore[i] = user_input.current_letter
      end
      print @underscore
    end

  end

end
