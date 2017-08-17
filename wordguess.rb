require "faker"

class Random_Word
  attr_reader #:word

  def initialize
    @word = "#{Faker::Overwatch.unique.hero}"
    @letters = @word.split('')
  end

  def letter_index(user_letter)
    letter_indeces =[]
    @letters.length.times do |i|
      if @letters[i] == user_letter
        letter_indeces << i
      end
    end
    return letter_indeces
  end

  def default_display
    puts "_ " * @word.length
  end
  def update_display
    puts


  end


  class user_inputs
    attr_reader
    attr_writer

  end


  def initialize
  end

end

class game
  attr_reader
  attr_writer

  def initialize
  end

  def flower
  end

  def remove_flower
  end

  def cat
  end

  def cat_move

  end
  POT
end


puts "Welcome to Word Guess!  Let me think of a word first..... ok got it"
puts "You can guess wrong 5 times until the cat eats you"
random_word = Random_Word.new
cat_position0
guess = 0
random_word.word_display

until guess == 5
  puts "guess one letter"
  # refactor into a method
  until user_input.length == 1 && user_input.to_i == 0
    user_input = gets.chomp
  end

  if random_word.letter_index(user_input).length > 0
    puts "nice"
    random_word.word_display(indeces)
  else
    puts "yikes"
    c += 1
    cat_position(guess)
  end
end
