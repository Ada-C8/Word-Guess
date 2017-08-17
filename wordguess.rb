require "faker"

class random_word
attr_reader :word

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
