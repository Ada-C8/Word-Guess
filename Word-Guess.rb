require 'faker'
require 'colorize'
class Party

  attr_accessor :word, :word_array, :dash_word, :score, :wrong_guess, :max_wrong_guess, :guessed_letters

  def initialize(difficulty = :easy)
    @difficulty = difficulty

    @word = Faker::Color.color_name

    case @difficulty
    when :easy
      generate_word(1, 3)
    when :medium
      generate_word(4, 5)
    when :hard
      generate_word(6, 8)
    else
      raise ArgumentError.new("Difficulty must be :easy, :medium or :hard.")
    end

    @word = Faker::Color.color_name

    @word_array = @word.split("")
    @dash_word = "_ " * @word.length
    @score = 0
    @wrong_guess = 0
    @max_wrong_guess = 5 #easy = 5, medium, hard = 3
    @guessed_letters = []
  end

  def ascii_skull
    skull1 = <<-HEREDOC
    .... NO! ...                  ... MNO! ...
    ..... MNO!! ...................... MNNOO! ...
    ..... MMNO! ......................... MNNOO!! .
    .... MNOONNOO!   MMMMMMMMMMPPPOII!   MNNO!!!! .
    HEREDOC

    skull2 = <<-HEREDOC
    ... !O! NNO! MMMMMMMMMMMMMPPPOOOII!! NO! ....
    ...... ! MMMMMMMMMMMMMPPPPOOOOIII! ! ...
    ........ MMMMMMMMMMMMPPPPPOOOOOOII!! .....
    ........ MMMMMOOOOOOPPPPPPPPOOOOMII! ...
    ....... MMMM..     OPPMMP      .,OMI! ....
    HEREDOC

    skull3 = <<-HEREDOC
    ...... MMMM::    o.,OPMP,.o    ::I!! ...
        .... NNM:::.,,OOPM!P,.::::!! ....
         .. MMNNNNNOOOOPMO!!IIPPO!!O! .....
        ... MMMMMNNNNOO:!!:!!IPPPPOO! ....
          .. MMMMMNNOOMMNNIIIIIPPPOO!! ......
    HEREDOC

    skull4 = <<-HEREDOC
         ...... MMMONNMMNNNIIIOOO!..........
      ....... MN MOMMMNNNIIIIIO! OO ..........
    ......... MNO! IiiiiiiiiiiiI OOOO ...........
    ...... NNN.MNO! . O!!!!!!!!!O . OONO NO! ........
    HEREDOC

    skull5 = <<-HEREDOC
    .... MNNNNNO! ...OOOOOOOOOOO .  MMNNON!........
    ...... MNNNNO! .. PPPPPPPPP .. MMNON!........
     ...... OO! ................. ON! .......
        ................................
    HEREDOC

    colored_skull = ""

    case @wrong_guess

      when 1
        colored_skull = skull1
      when 2
        colored_skull = skull1 + skull2
      when 3
        colored_skull = skull1 + skull2 + skull3
      when 4
        colored_skull = skull1 + skull2 + skull3 + skull4
      when 5
        colored_skull = skull1 + skull2 + skull3 + skull4 + skull5
    end

    puts colored_skull.colorize(:red)

  end

  def check_letter(guess_letter)

    if valid_input?(guess_letter)
      while @guessed_letters.include? guess_letter
        puts "\nYou already guessed #{guess_letter}!"
        print "Please enter another letter:"
        guess_letter = gets.chomp
        valid_input?(guess_letter)
      end
      @guessed_letters << guess_letter
      @guessed_letters.uniq!
      if @word_array.include? guess_letter
        @word_array.length.times do |index|
          if word_array[index] == guess_letter
            @dash_word[index * 2] = guess_letter
          end
        end
        @score += 1
      else
        @wrong_guess += 1
        ascii_skull
      end
    end
    check_if_winner
  end

  def check_if_winner
    if winner?
      return "You win!!!!"
    elsif game_over?
      return "game over!!! the word was #{@word}"
    end
  end

  def game_over?
    return @wrong_guess == @max_wrong_guess
  end

  def winner?
    #if no more dashes, win!
    return !(@dash_word.include? "_")
  end

  private

  def valid_input?(guess_letter)
    if ('a'..'z').include? guess_letter
      return true
    else
      puts "\nInvalid input. Enter only letters."
      return false
    end
  end

  def generate_word minLimit, maxLimit
    until @word.length >= minLimit && @word.length <= maxLimit
      @word = Faker::Color.color_name
    end
  end

end

party1 = Party.new
puts "\n\nWelcome to Word Guess!!!!!!\n\n"
puts party1.dash_word
puts "\n\nGuess a letter: "
guess = gets.chomp.downcase
party1.check_letter(guess)


until party1.game_over? || party1.winner?
  puts "\n\nLetters Guessed:\n"
  print party1.guessed_letters
  puts "\n"
  puts party1.dash_word
  print "\n\nGuess a letter: "
  guess = gets.chomp.downcase
  puts party1.check_letter(guess)

end
