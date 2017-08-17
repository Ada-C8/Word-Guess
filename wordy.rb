require 'colorize'
#one class, methods,

dictionary = []

guesses = []

word = []#pick word random from dictionary

hidden_word = []

word.length.times do hidden word << "____ "
end

def letter_included
  word.each do |letter|
    if word.include? == true
      puts "Good Guess"
      # remove letter from list
    else # ascii minus something
    end
  end
end # End letter_included

def pick_a_letter
  begin

    puts "pick a letter"
    letter_guess = gets.chomp.capitalize

    if letter_guess =~ /A-Za-z/
    else
    puts "No, pick a LETTER."
      retry
    end
  end
end # End pick_a_letter

guesses << pick_a_letter

letter_included
