require 'faker'
require 'artii'
require 'colorize'

def ascii
  file = File.open("/Users/kimberley/Desktop/asciiartfile.txt", "r")
  contents = file.read
  puts contents
end

def decompose_image
  line_limit = [20, 15, 10, 5]
  index = (@turns - 1)
  partial_image = IO.readlines("/Users/kimberley/Desktop/asciiartfile.txt")[1...line_limit[index]]
  puts partial_image
end
  # line = 1
  #
  # until line == 20
  #   File.open("/Users/kimberley/Desktop/asciiartfile.txt").readlines(line) do |each_line|
  #     puts each_line
  #     line += 1
  #   end
  # end
# end

class Word

  attr_reader :word, :letters, :blanks

  def initialize(word: Faker::Dessert.variety.downcase)
    @word = word
    @letters = word.split("")
    @letters << @word
    @blanks = "-" * (@letters.length - 1)
  end

  def contains?(letter_guess)
    return @letters.include?(letter_guess)
  end

  def replace_blanks(letter_guess)
    indices = find_indices(letter_guess)

    indices.each do |index|
      @blanks[index] = letter_guess
    end
    puts @blanks
  end

  private

  def find_indices(letter_guess)
    indices = []

    (0..@letters.length).each do |index|
      if letter_guess == @letters[index]
        indices << index
      end
    end

    return indices
    # @letters.each do |letter|
    #   if letter_guess == letter

  end


end #end of class

class Game

  attr_reader :game_word, :guesses, :turns

  # just for testing
  attr_writer :game_word

  def initialize
    #@art = newart
    @game_word = Word.new
    @guesses = []
    @turns = 0
  end



  def guess(user_guess)
    # if user_guess.length > 1 && user_guess == @word
    #   Game.win
    while user_guess.match(/[^a-z]/)
      puts "\nPlease return a valid letters from A to Z.\n"
      user_guess = gets.chomp.downcase
    end
    if @guesses.include?(user_guess)
      puts "\nYou guessed that letter already!"
      return
    end
    if @game_word.word == user_guess
      you_won
    end

    if @game_word.contains?(user_guess)
      reveal(user_guess)
      win?
    else
      puts "\nSorry, that letter is not in your word.\nThere goes some delicious cupcake...\n\n"
      @turns += 1
      lose?
      decompose_image
    end

    @guesses << user_guess
  end

  def print_guesses
    if @guesses.length > 0
    guess_string = ""
    @guesses.each do |guess|
      guess_string += guess.upcase + " "
    end
    puts "\nHere are the letters you have guessed so far: #{guess_string}"
  end
  end



  def reveal(user_guess)
    puts "\nYes! Here's your word so far:\n"
    @game_word.replace_blanks(user_guess)
    @game_word.blanks
  end

  def lose?
    if @turns == 5
      puts "You LOST."
      puts "Your word was #{@game_word.word}"
      exit
    end
  end

  def win?
    if !@game_word.blanks.include?("-")
        you_won
    end
  end

  def you_won
    artii = Artii::Base.new :font => 'slant'
    artii = artii.asciify("You WIN!")
    puts artii.colorize(:blue).blink
      exit
  end

end # end of class

game = Game.new
all_turns = 0
game.game_word = Word.new(word: "pie")

puts "Welcome to FILL IN THE BLANKS, a word guess game!"
puts "\nRULES: \nEach blank represents one letter of the word \nYour guess can be one letter or the whole word \nIf you're right, those letters will be revealed \nIf you're wrong, your cupcake will start to melt \nWhen your cupcake is a puddle of sugar, you lose. \nGood luck!\n\n"

ascii
puts "Your mystery word is (drumroll, please...)\n #{game.game_word.blanks}"


until game.win? || game.lose?
game.print_guesses
puts "What's your guess?"
guess = gets.chomp.downcase
game.guess(guess)
end
