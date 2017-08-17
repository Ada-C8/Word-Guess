require 'random-word'
RandomWord.exclude_list.push(/_/, /\'/, /-/)

#word class for unique words
class Word
  attr_accessor :guesses
  attr_reader :word, :letters, :num

  def initialize
    if [1, 2, 3].sample == 3
      @word = RandomWord.adjs.next
    else
      @word = RandomWord.nouns.next
    end
    @letters = word.split("")
    @num = @letters.length
    @guesses = []
  end

  def display

  end

  def guess
    @guess = gets.chomp.to_s.downcase
    until ('a'..'z').to_a.include?(@guess)
      puts "Please enter a single letter."
      @guess = gets.chomp.to_s.downcase
    end
  end
end #end Word class


attempt = Word.new
puts attempt.word
attempt.display
print attempt.letters
puts attempt.num
attempt.guess
