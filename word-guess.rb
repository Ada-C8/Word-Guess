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
    num_correct = 0
    @letters.each do |letter|
      if @guesses.include?(letter)
        print letter + " "
        num_correct += 1
      else
        print "_ "
      end
    end
    print "\n"
    if num_correct == @num
      puts "You guessed the word! WOOO!"
      exit
    end
    num_correct = 0
  end

  def guess
    puts "Please guess a letter!"
    @guess = gets.chomp.to_s.downcase
    # check if the guess is a valid guess
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
    # check if the guess is in the word
    return @letters.include?(@guess)
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
puts attempt.guess
attempt.display
puts attempt.guess
attempt.display
puts attempt.guess
attempt.display
puts attempt.guess
attempt.display
puts attempt.guess
attempt.display
puts attempt.guess
attempt.display
puts attempt.guess
attempt.display
puts attempt.guess
attempt.display
puts attempt.guess
attempt.display
puts attempt.guess
attempt.display
puts attempt.guess
attempt.display
puts attempt.guess
attempt.display
puts attempt.guess
attempt.display
puts attempt.guess
