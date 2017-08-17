class Word
  # pull word from dictionary.txt
  attr_reader :game_word

  # def select_word
  def initialize
    dictionary_array = []
    File.open("dictionary.txt", "r").each do |line|
      dictionary_array.push(line.chomp)
    end
    @game_word = dictionary_array.sample.split("")
  end

end

class User

  attr_reader :letter, :correct_guesses, :dashes

  # ask user for a letter guess
  #store letter guess in a variable
  #check variable against the array of string letters
  #
  def initialize(word)
    @word = word
    @correct_guesses = Array.new(word.game_word.length, "").join
    @dashes = Array.new(word.game_word.length, "-").join
  end

  def user_input
    puts "Guess a letter."
    @letter = gets.chomp
    if @word.game_word.include?(@letter)
      puts right_guess
    else
      puts wrong_guess
    end
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



new_game = word.new
rebecca = User.new(new_game)

# display progres


puts "You have to guess a word that is #{new_game.game_word.length} spaces."
puts rebecca.correct_guesses
puts rebecca.dashes

puts "This is the game word: #{new_game.game_word}"



# rebecca = User.new(new_game)
rebecca.user_input
