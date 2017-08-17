# Create class

class WordGuess



  def initialize(answer_array)
    @answer = answer_array.sample.split(//)
  end

  def guess
    puts "Please enter the letter you'd like to guess."
    guess = gets.chomp
    return @answer.include?(guess)
  end

  def answer
    answer = @answer
    return answer
  end

end

answer_array = ["cat", "bat", "dog"]


word_try = WordGuess.new(answer_array)

puts word_try.answer

puts word_try.guess 
