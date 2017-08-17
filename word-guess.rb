require 'random-word'

#word class for unique words
class Word
  attr_reader :word
  def initialize
    if [1, 2, 3].sample == 3
      @word = RandomWord.adjs.next
    else
      @word = RandomWord.nouns.next
    end
  end

  def display

  end



end
word = Word.new
puts word.word
