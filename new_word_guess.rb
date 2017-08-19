require 'colorize'
require 'random-word'

class Game

  def initialize(answer)


    puts answer
    @correct_guesses = []
    @incorrect_guesses = []
    @tries = 7

    @answer_as_array = split_answer(answer)

    while @tries > 0
      if @tries > 1
        accept_user_guess
        display
        if correct_display == answer
          puts "~WINNER~~WINNER~~WINNER~".colorize(:light_magenta)
          exit
        end
      elsif @tries == 1
        puts "You LOST! You LOST! You LOST!".colorize(:light_red)
        exit
      end
    end
  end

  def sushi_display
    <<~SUSHI

    ,'' ;  ;  ; ''|||\///
    ',,_;__;__;__;,'''/\\\\
    |           |
    '.________.'
    SUSHI
  end


  private

  def split_answer(answer)
    return answer.split(//)
  end

  def accept_user_guess
    puts "Please enter a letter"
    user_input = gets.chomp.downcase
    unless /([a-z])/.match(user_input)
      puts "Invalid guess! Letters only please! Please try again."
      user_input = gets.chomp.downcase
    end
    if @answer_as_array.include?(user_input)
      @correct_guesses << user_input
      puts clear_screen
    else
      if @incorrect_guesses.include?(user_input)
        puts "You already guessed that letter! No penalty, but try not to do it again!".colorize(:light_green)
      else
        @incorrect_guesses << user_input
        @tries -= 1
        puts clear_screen
      end
    end
  end

  def correct_display
    display_array = ""
    @answer_as_array.each do |letter|
      if @correct_guesses.include? letter
        display_array << letter
      else
        display_array << "_"
      end
    end
    return display_array
  end

  def display
    puts "Number of sushi pieces == number of tries remaining"
    (@tries - 1).times do
      print sushi_display
    end
    puts "Correct guesses: #{correct_display}".colorize(:light_blue)
    puts "Incorrect guesses: #{@incorrect_guesses}".colorize(:red)
  end

def clear_screen
  return "\e[H\e[2J"
end

end

#freestanding welcome method
def welcome
  puts "Welcome to the sushi word game! If you run out of sushi before you guess the word, you lose!!".colorize(:green)
  puts "Pick your level: easy or hard:"
  level = gets.chomp.downcase
    unless level == "easy" || level == "hard"
      puts "Invalid answer. Please enter easy or hard."
      level = gets.chomp.downcase
    end

  @answer = ""
  easy_answer_array = ["pink", "cat", "dolphin", "picnic", "sashimi", "tuna", "nigiri", "wasabi"]
  hard_answer_array = []
  hard_answer_array = 10.times.map { RandomWord.adjs.next.gsub('_', ' ') }

  if level == "easy"
    @answer = easy_answer_array.sample
  elsif level == "hard"
    @answer = hard_answer_array.sample
  end

  return @answer
end

# running program 

new_game = Game.new(welcome)
