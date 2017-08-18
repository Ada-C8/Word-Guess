require "random_word"
require "colorize"
require_relative 'Centipede'
class Game
  attr_reader :random_word, :partial_answer, :string_word, :incorrect_guess, :list_guesses
  def initialize
    @incorrect_guess = 0
    @partial_answer = []
    @list_guesses = []
    generate_answer
    generate_partial_answer
  end

  def generate_answer
    @random_word = RandomWord.nouns(not_shorter_than: 3, not_longer_than: 7).next
    @random_word = @random_word.chars
    @string_word = @random_word.join("")
  end

  def generate_partial_answer
    length = @random_word.length
    length.times do
      @partial_answer.push("_")
    end
    return @partial_answer
  end

  def check_guess(input)
    display_partial_answer(input)
    display_art
    if @random_word.include? input
      # display_partial_answer(input)
      # display_art
    else
      add_incorrect_guess(input)
      # display_partial_answer(input)
      # display_art
    end
    return "Incorrect guesses: #{@list_guesses}\n"
  end

  def win_game(input)
    if input == @string_word
      puts "Your word was: #{@string_word}"
      puts "WAHOO! YOU WIN!"
      exit
    elsif @incorrect_guess == 10
      present = Centipede.new
      puts present.art[11]
      puts "                          Your word was: #{@random_word.join("")}".colorize(:red)
      exit
    else
      unless @partial_answer.include? "_"
        puts "WAHOO! YOU WIN!"
        exit

      end
    end
  end

  def add_incorrect_guess(input)
    unless list_guesses.include?(input) || input.to_i.to_s == input
      @incorrect_guess+=1
      @list_guesses << input
      win_game(input)
    end
  end

  def display_partial_answer(input)
    @random_word.each_with_index do |letter, index|
      if input == letter
        @partial_answer[index] = input
      end
    end
    print "\nWord: #{@partial_answer.join(" ")}\n"
    win_game(input)
  end

  def display_art
    display = Centipede.new
    puts display.art[@incorrect_guess]
  end

# actual game play
game1 = Game.new
intro = Centipede.new
puts "Welcome to Word Guess!"
puts intro.art[10]

 loop do
    # print game1.random_word
   puts "Word: #{game1.partial_answer.join(" ")}"
   puts
   puts "Please choose a letter:"
   input = gets.chomp.downcase
   if input.length == 1 && /[[:lower:]]/.match(input)
     puts game1.check_guess(input)
   else
     puts game1.check_guess(input)
     puts "Please enter ONE LETTER unless you have the full word:"
   end
 end
end
