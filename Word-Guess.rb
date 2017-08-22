require 'faker'
require 'colorize'
require 'artii'

class Round

  attr_reader :word_array, :dash_word, :score, :wrong_guess, :max_wrong_guess, :guessed_letters

  def initialize(difficulty = "easy", category = "color")
    @difficulty = difficulty
    @category = category
    @word = ""
    @win = false
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

  def check_guess(guess)
    if guess == @word
      @win = true
    elsif valid_input?(guess)
      while @guessed_letters.include? guess
        puts "\nYou already guessed #{guess}!"
        print "Please enter another letter:"
        guess = gets.chomp
        valid_input?(guess)
      end
      system "clear"
      @guessed_letters << guess
      @guessed_letters.uniq!
      puts "\n\nLetters Guessed:\n"
      print @guessed_letters
      if @word_array.include? guess
        update_dash_word(guess)
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
      puts a.asciify('You Win!').colorize(:green).blink
      return "The word is: #{@word}"
    elsif game_over?
      a = Artii::Base.new :font => 'slant'
      puts a.asciify('Game Over!').colorize(:red).blink
      return "The word is: #{@word}"
    end
  end

  def game_over?
    return @wrong_guess == @max_wrong_guess
  end

  def winner?
    #if no more dashes, win!
    return !(@dash_word.include? "_") || @win == true
  end

  private

  def valid_input?(guess)
    if guess != @word && guess.length > 1
      @wrong_guess += 1
      ascii_skull
      puts "\nThat is not the right word :( Try another word or just one letter."

      return false
    elsif ('a'..'z').include? guess
      return true
    else
      puts "\nInvalid input. Enter only letters."
      return false
    end
  end

  def update_dash_word(letter)
    @word_array.length.times do |index|
      if word_array[index] == letter
        @dash_word[index * 2] = letter
      end
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
round1.check_guess(guess)


until round1.game_over? || round1.winner?
  puts "\n"
  puts round1.dash_word
  print "\n\nGuess a letter: "
  guess = gets.chomp.downcase
  puts round1.check_guess(guess)

end
