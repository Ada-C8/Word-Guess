require 'faker'
require 'colorize'
require 'artii'

class Round

  attr_accessor :word, :word_array, :dash_word, :score, :wrong_guess, :max_wrong_guess, :guessed_letters

  def initialize(difficulty = "easy", category = "color")
    @difficulty = difficulty
    @category = category
    @word = ""

    @max_wrong_guess = 0

    until ["easy", "medium", "hard"].include? @difficulty
      puts "\nInvalid difficulty, pleaese enter another a vaild difficulty."
      puts "\nOur available difficulties are: easy, medium, hard: "
      @difficulty = gets.chomp.downcase
    end

    case @difficulty
    when "easy"
      @max_wrong_guess = 8
    when "medium"
      @max_wrong_guess = 5
    when "hard"
      @max_wrong_guess = 3
    # else
    #   raise ArgumentError.new("Difficulty must be easy, medium or hard.")
    end

    until ["color", "food", "hipster", "jobs"].include? @category
      puts "\nInvalid category, please enter another one."
      @category = gets.chomp.downcase
    end

    case @category
    when "color"
        @word = Faker::Color.color_name
    when "food"
        @word = Faker::Food.dish
    when "hipster"
        @word = Faker::Hipster.word
    when "jobs"
        @word = Faker::Job.title
    end

    @word_array = @word.split("")
    @dash_word = ""
    @word.length.times do |index|
      @word[index] == " " ? (@dash_word += "  ") : (@dash_word += "_ ")
    end
    @score = 0
    @wrong_guess = 0
    @guessed_letters = []
  end

  def ascii_skull
    skull = <<-HEREDOC
       .... NO! ...                  ... MNO! ...
     ..... MNO!! ...................... MNNOO! ...
    ..... MMNO! ......................... MNNOO!! .
    .... MNOONNOO!   MMMMMMMMMMPPPOII!   MNNO!!!! .
    ... !O! NNO! MMMMMMMMMMMMMPPPOOOII!! NO! ....
      ...... ! MMMMMMMMMMMMMPPPPOOOOIII! ! ...
     ........ MMMMMMMMMMMMPPPPPOOOOOOII!! .....
     ........ MMMMMOOOOOOPPPPPPPPOOOOMII! ...
      ....... MMMMM..    OPPMMP    .,OMI! ....
       ...... MMMM::   o.,OPMP,.o   ::I!! ...
           .... NNM:::.,,OOPM!P,.::::!! ....
            .. MMNNNNNOOOOPMO!!IIPPO!!O! .....
           ... MMMMMNNNNOO:!!:!!IPPPPOO! ....
             .. MMMMMNNOOMMNNIIIPPPOO!! ......
            ...... MMMONNMMNNNIIIOO!..........
         ....... MN MOMMMNNNIIIIIO! OO ..........
      ......... MNO! IiiiiiiiiiiiI OOOO ...........
    ...... NNN.MNO! . O!!!!!!!!!O . OONO NO! ........
     .... MNNNNNO! ...OOOOOOOOOOO .  MMNNON!........
     ...... MNNNNO! .. PPPPPPPPP .. MMNON!........
        ...... OO! ................. ON! .......
           ................................
    HEREDOC

    skull_lines = skull.split("\n")
    colored_skull = []

    case @difficulty

    when "easy"
      case @wrong_guess
      when 1
        colored_skull = skull_lines[0..2]
      when 2
        colored_skull = skull_lines[0..5]
      when 3
        colored_skull = skull_lines[0..8]
      when 4
        colored_skull = skull_lines[0..11]
      when 5
        colored_skull = skull_lines[0..14]
      when 6
        colored_skull = skull_lines[0..17]
      when 7
        colored_skull = skull_lines[0..20]
      when 8
        colored_skull = skull_lines[0..22]
      end

    when "medium"
      case @wrong_guess
      when 1
        colored_skull = skull_lines[0..4]
      when 2
        colored_skull = skull_lines[0..9]
      when 3
        colored_skull = skull_lines[0..14]
      when 4
        colored_skull = skull_lines[0..19]
      when 5
        colored_skull = skull_lines[0..22]
      end

    when "hard"
      case @wrong_guess
      when 1
        colored_skull = skull_lines[0..7]
      when 2
        colored_skull = skull_lines[0..14]
      when 3
        colored_skull = skull_lines[0..22]
      end
    end

    puts "\n\n" + colored_skull.flatten.join("\n").colorize(:red)
  end

  def check_letter(guess_letter)
    if valid_input?(guess_letter)
      while @guessed_letters.include? guess_letter
        puts "\nYou already guessed #{guess_letter}!"
        print "Please enter another letter:"
        guess_letter = gets.chomp
        valid_input?(guess_letter)
      end
        system "clear"
      @guessed_letters << guess_letter
      @guessed_letters.uniq!
                  puts "\n\nLetters Guessed:\n"
                  print @guessed_letters
      if @word_array.include? guess_letter
        @word_array.length.times do |index|
          if word_array[index] == guess_letter
            @dash_word[index * 2] = guess_letter
          end
        end
        @score += 1
      else
        @wrong_guess += 1
      end
      ascii_skull
    end
    check_if_winner
  end

  def check_if_winner
    if winner?
      a = Artii::Base.new :font => 'slant'
      system "clear"
      puts a.asciify('You Win!').colorize(:green)
      return "The word is: #{@word}"
    elsif game_over?
      a = Artii::Base.new :font => 'slant'
      puts a.asciify('Game Over!').colorize(:red)
      return "The word is: #{@word}"
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

end



puts "\n\nWelcome to Word Guess!!!!!!\n\n"
print "Choose a difficulty >> "
difficulty = gets.chomp.downcase
print "Now choose a category. Our available categories are: color, jobs, hipster, and food. >> "
category = gets.chomp.downcase
round1 = Round.new(difficulty, category)
puts round1.dash_word
puts "\n\nGuess a letter: "
guess = gets.chomp.downcase
round1.check_letter(guess)


until round1.game_over? || round1.winner?
  # puts "\n\nLetters Guessed:\n"
  # print round1.guessed_letters
  puts "\n"
  puts round1.dash_word
  print "\n\nGuess a letter: "
  guess = gets.chomp.downcase
  puts round1.check_letter(guess)

end




  skull5 = <<-HEREDOC
     .... NO! ...                  ... MNO! ...
   ..... MNO!! ...................... MNNOO! ...


  ..... MMNO! ......................... MNNOO!! .
  .... MNOONNOO!   MMMMMMMMMMPPPOII!   MNNO!!!! .
  ... !O! NNO! MMMMMMMMMMMMMPPPOOOII!! NO! ....

    ...... ! MMMMMMMMMMMMMPPPPOOOOIII! ! ...
   ........ MMMMMMMMMMMMPPPPPOOOOOOII!! .....
   ........ MMMMMOOOOOOPPPPPPPPOOOOMII! ...


    ....... MMMMM..    OPPMMP    .,OMI! ....
     ...... MMMM::   o.,OPMP,.o   ::I!! ...
         .... NNM:::.,,OOPM!P,.::::!! ....


          .. MMNNNNNOOOOPMO!!IIPPO!!O! .....
         ... MMMMMNNNNOO:!!:!!IPPPPOO! ....
           .. MMMMMNNOOMMNNIIIPPPOO!! ......


          ...... MMMONNMMNNNIIIOO!..........
       ....... MN MOMMMNNNIIIIIO! OO ..........
    ......... MNO! IiiiiiiiiiiiI OOOO ...........


  ...... NNN.MNO! . O!!!!!!!!!O . OONO NO! ........
   .... MNNNNNO! ...OOOOOOOOOOO .  MMNNON!........
   ...... MNNNNO! .. PPPPPPPPP .. MMNON!........


      ...... OO! ................. ON! .......
         ................................

      HEREDOC
