require "faker"

class Random_Word
  attr_reader :guess

  def initialize
    @word = "#{Faker::Overwatch.unique.hero}"
    @letters = @word.split('')
    @guess = 0
    puts "Welcome to Word Guess!  Let me think of a word first..... ok got it"
    puts "You can guess wrong 5 times until the cat eats you"
    @word_display = []
    @letters.length.times do
      @word_display << "_"
    end
    cat_display(@guess)
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

  def update_display(letter_indeces)
    letter_indeces.each do |index|
      @word_display[index] = @letters[index]
    end
    puts @word_display
  end

  def cat_position
  case @guess
  when 0

  when 1
    looking cat
  when 2

  when 3
  when 4
  when 5

  end

end # end random_word class


puts "Welcome to Word Guess!  Let me think of a word first..... ok got it"
puts "You can guess wrong 5 times until the cat eats you"
random_word = Random_Word.new
cat_position0

random_word.word_display

until random_word.guess == 5
  puts "guess one letter"
  # refactor into a method
  until user_input.length == 1 && user_input.to_i == 0
    user_input = gets.chomp
  end

  if random_word.letter_index(user_input).length > 0
    puts "nice"
    random_word.update_display(indeces)
  else
    puts "yikes"
    random_word.guess += 1
    cat_position(random_word.guess)
  end
end
