

class Game

  def initialize(input_word)
    @word = input_word.chars.to_a
    @hidden_word = @word.join.gsub(/[A-Za-z]/, "_")
    @bad_guesses = 0
  end

  def guess(letter)
    if @word.include?(letter) == false
      @bad_guesses += 1
      puts "I'm sorry, that letter is not in this word!"
    else
      puts "Excellent choice!!"
      until @word.include?(letter) == false
        index = @word.index(letter)
        @word[index] = "*"
        @hidden_word[index] = letter
      end
    end
  end

  def print_guessed_word() # prints hidden word
    puts " Word: #{@hidden_word}"
  end

  def print_picture()
    count = 5 - @bad_guesses
    puts "(@)" * count
    puts "  ,\\,\\,|,/,/,"
    puts "     _\\|/_"
    puts "    |_____|"
    puts"     |   |"
    puts "     |___|"
  end

  def is_game_lost()
    if @bad_guesses >= 5
      return true
    else
      return false
    end
  end

  def is_game_won()
    if @hidden_word.include?("_")
      return false
    else
      return true
    end
  end


end

# Main program
word_array = ["towel", "plant", "apples", "spirit", "yoga", "banana", "missisipi"]
rand_num = rand(0..(word_array.length - 1))
g1 = Game.new(word_array[rand_num])

while true
  puts "***********"
  g1.print_guessed_word()
  puts "***********"
  puts "Please enter a letter:"
  letter = gets.chomp.downcase
  g1.guess(letter)
  g1.print_picture()
  if (g1.is_game_lost)
    puts "I'm sorry, you lost! :("
    break
  elsif g1.is_game_won
    puts "HOORAY! You WON!! :) "
    break
  end
end
