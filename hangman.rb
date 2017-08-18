
class Hangman
  attr_accessor :guesses, :word, :hidden_word, :wrongs

  def initialize
    @guesses = []
    @word = "" #pick word random from dictionary
    @hidden_word = []
    @wrongs = 0
  end

  def make_hidden_word
    @word.length.times do @hidden_word << "____  "
    end

  end

  def choose_word(dictionary)
    @word = dictionary.sample.upcase
  end

  def replace_hidden_with_letter(letter)
    word_index =(0 ... @word.length).find_all {|i| @word[i,1] == letter}
    num_letters = word_index.length

    num_letters.times do |this|
      @hidden_word[word_index[this]] = letter
    end
  end


  def letter_included(guess)
    @word.chars.each do |letter|
      if @word =~ /#{guess}/
        puts "Good Guess"
        # add letter to hidden_word
        replace_hidden_with_letter(guess)
        #################
        puts @hidden_word
      else # ascii minus something
      end
    end
  end # End letter_included


  def pick_a_letter

    while @word.split("") != @hidden_word

      puts "pick a letter"
      letter_guess = gets.chomp.capitalize

      case
      when !!!(letter_guess =~ /A-Za-z/) && @guesses.include?(letter_guess) != true
        @guesses << letter_guess
        letter_included(letter_guess)
        puts "#{hidden_word}"
      else
        puts "No, pick another letter."
      end
      # guesses << pick_a_letter
      # letter_included(letter_guess)
    end
  end

end # End of Hangman
