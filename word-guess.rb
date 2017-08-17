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
    valid = 0
    until valid == 1
      if is_letter?(@guess) && !already_guessed?(@guess)
        valid = 1
        @guesses.push(@guess)
      else
        if already_guessed?(@guess)
          puts "You already chose that letter! Please choose another."
        else
          puts "Please enter a single letter."

        end
        @guess = gets.chomp.to_s.downcase
      end
    end




  end

  private

  def is_letter?(guess)
    return ('a'..'z').to_a.include?(@guess)
  end

  def already_guessed?(guess)
    return @guesses.include?(guess)
  end
end #end Word class


attempt = Word.new
puts attempt.word
attempt.display
print attempt.letters
puts attempt.num
attempt.guess
attempt.guess
attempt.guess
attempt.guess
