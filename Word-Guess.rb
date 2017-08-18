require 'faker'
class Party

  attr_accessor :word, :word_array, :dash_word, :score, :wrong_guess, :max_wrong_guess, :guessed_letters

  def initialize
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

    case @wrong_guess
      when 1
        puts skull1
      when 2
        puts skull1, skull2
      when 3
        puts skull1, skull2, skull3
      when 4
        puts skull1, skull2, skull3, skull4
      when 5
        puts skull1, skull2, skull3, skull4, skull5
    end
  end

  def check_letter(guess_letter)
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

    if winner
      puts "You win!!!!"
    elsif game_over
      puts "game over!!! the word was #{@word}"
    end

    return @word.include? guess_letter

  end

  def game_over
    return @wrong_guess == @max_wrong_guess
  end

  def winner
    #if no more dashes, win!
    return !(@dash_word.include? "_")
  end

end

party1 = Party.new
puts "\n\nWelcome to Word Guess!!!!!!\n\n"
puts party1.dash_word
puts "\n\nGuess a letter: "
guess = gets.chomp
party1.check_letter(guess)

until party1.game_over || party1.winner
  puts "\n\nLetters Guessed:\n"
  print party1.guessed_letters
  puts "\n"
  puts party1.dash_word
  print "\n\nGuess a letter: "
  guess = gets.chomp
  party1.check_letter(guess)

end
