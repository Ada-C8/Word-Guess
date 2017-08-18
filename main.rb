require_relative "word.rb"
require_relative "explosive.rb"

class User

  attr_reader :letter, :correct_guesses, :dashes, :guesses

  # ask user for a letter guess
  #store letter guess in a variable
  #check variable against the array of string letters
  #
  def initialize(word)
    @word = word
    @correct_guesses = Array.new(word.game_word.length)
    @dashes = Array.new(word.game_word.length, "-")
    @guesses = []
    @counter = 0
  end

  def user_input
    loop do
      puts "Guess a letter."
      @letter = gets.chomp.downcase
      if @guesses.include?(@letter)
        puts "please provide a new letter "
      else
        @guesses << @letter
        break
      end
    end


    if @word.game_word.include?(@letter)
      puts right_guess
      index_array = @word.game_word.each_index.select{|i| @word.game_word[i] == @letter}
      index_array.each do |i|
        @correct_guesses[i] = @letter
      end
      puts "#{@correct_guesses}"

    else
      puts wrong_guess
      @counter += 1
    end
    print @guesses
  end

  def right_guess
    puts "You guessed right! Wingardium leviosa!"
  end

  def wrong_guess
    puts "Wrong guess. You must be up to no good..."
  end


  # def check_guess
  #   game_word.include?
  # end
  #
end



new_game = Word.new
rebecca = User.new(new_game)

# display progres


puts "You have to guess a word that is #{new_game.game_word.length} spaces."
print "#{rebecca.correct_guesses.join}\n"
print "#{rebecca.dashes.join}\n"

puts "This is the game word: #{new_game.game_word}"

while rebecca.correct_guesses.include?(nil)
  rebecca.user_input
end
test = Image.new
puts test.guess_six
# rebecca = User.new(new_game)
#
# rebecca.user_input
