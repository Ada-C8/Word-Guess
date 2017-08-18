# require 'letter'

class Word
  attr_reader :word, :dash_array, :word_array, :correct_guess, :wrong_guess

  def initialize(word)
    @word = word
    @dash_array = dash_array
    @word_array = word_array
    @correct_guess = correct_guess
    @wrong_guess = wrong_guess
  end

  def letter_in_word(letter)
    # split_word
    if @word_array.include?(letter)
      # index = @word.each_index.select{|i| @word[i] == letter}
      # index.each do |value|
      #   value = "_"
      #   puts value
      end
    end
  end

def split_word(word)
  @word_array.split("")
end

def display_dash(dash_count)
  dash_count = @word_array.count
  dash_count.times do
    print " _ "
  end
end

# def list(random_words)
#   @word << random_words
# end

def check
  until @wrong_guesses == 6 || @word == @show_user
    puts "Guess a letter:"
    @guess = gets.chomp
end

def check_guess(guess)
  if @word.include?(guess)
    if !@show_user.include?(@guess)
      puts "Great! #{guess} is a match!"
      @correct_guesses += 1
      replace_letter
    end
  else
    puts "Nope"
    @wrong_guesses += 1
    ascii_change
  end
  @total_guesses += 1
  puts @show_user.join
end


# def correct_guess
#   if @word_array.include?(letter)
#     @correct_guess = split_word.display_dash
#   end
#   # displ ay actual guess/word
# end


def wrong_guess
  # display incorrect guess/es
end

def results
end

end # end of word class

random = ["cat", "dog", "frog", "horse", "bird", "monkey", "pidgeon", "mouse", "rabbit", "lama"].sample
barb = Word.new(random)
puts barb.display_dash("cat")
barb.split_word("cat")
barb.letter_in_word("a")
