# Word guess game - Kayla and Laura
require "colorize"

class WordGuess
  attr_reader :game

  def initialize
    @game = game
    @tries = 10
  end

  def word_bank
    # tries = 10
    word_list = ["Accio", "Patronus", "Wand", "Hermione", "Snitch", "Dobby"]
    our_word = word_list.sample.upcase
    our_word_split = our_word.scan(/\w/).uniq.flatten.sort

    word_split = our_word.scan(/\w/)
    empty_array = Array.new(word_split.length) {'_'}

    puts "Welcome to our wonderful word guessing game! You have 10 tries to guess the word, one letter at a time!"
    print "Whats your first letter guess? (a through z): "
    wrong_guess = []
    right_guess = []


    until @tries == 0
      puts "\n"
      puts "      .--.          " + "                    " + "         BBBB.  "
      puts "      |  |          " + "                    " + "        \e[1mOO--\e[0mBB  "
      if @tries == 10
        puts "      MMMM          " + "        \\|/         ".green + "         L__B'  "
        puts "     /MMMMMMMMMO====" + "--------->".green + "<---------".red + "=====ONNNNNNNN  "
        puts "    /MMMMM\\MMMM    " + "         /|\\        ".red + "          NNNNN "
      elsif @tries > 7
        puts "      MMMM          " + "          \\|/       ".green + "         L__B'  "
        puts "     /MMMMMMMMMO====" + "----------->".green + "<-------".red + "=====ONNNNNNNN  "
        puts "    /MMMMM\\MMMM    " + "           /|\\      ".red + "          NNNNN "
      elsif @tries > 5
        puts "      MMMM          " + "            \\|/     ".green + "         L__B'  "
        puts "     /MMMMMMMMMO====" + "------------->".green + "<-----".red + "=====ONNNNNNNN  "
        puts "    /MMMMM\\MMMM    " + "             /|\\    ".red + "          NNNNN "
      elsif @tries > 3
        puts "      MMMM          " + "              \\|/   ".green + "         L__B'  "
        puts "     /MMMMMMMMMO====" + "--------------->".green + "<---".red + "=====ONNNNNNNN  "
        puts "    /MMMMM\\MMMM    " + "               /|\\  ".red + "          NNNNN "
      else
        puts "      MMMM          " + "                \\|/ ".green + "         L__B'  "
        puts "     /MMMMMMMMMO====" + "----------------->".green + "<-".red + "=====ONNNNNNNN  "
        puts "    /MMMMM\\MMMM    " + "                 /|\\".red + "          NNNNN "
      end
      puts "   /MMMMM   \\MM    " + "                    " + "          NNNNN "
      puts "  /MMMMMM     \\    " + "                    " + "         DDD DD "
      puts " /MMMMMMM           " + "                    " + "       DDD  DD  "
      puts "/MMMMMMMM           " + "                    " + "     DDDD  DDD  "
      puts "\n"
      puts "Guess this word:".blue
      p empty_array
      puts "You've already guessed these letters:".red
      p wrong_guess
      letter = gets.chomp.upcase

      if our_word.include? letter
        right_guess << letter
        right_guess = right_guess.uniq.flatten.sort
        puts "You guessed right!"

        word_split.each_index do |i|
          if letter == word_split[i]
            empty_array[i] << letter
          end
        end

        if right_guess == our_word_split
          puts our_word
          puts "\n"
          puts "
          ██╗   ██╗ ██████╗ ██╗   ██╗     █████╗ ██████╗ ███████╗     █████╗     ██╗    ██╗██╗███████╗ █████╗ ██████╗ ██████╗
          ╚██╗ ██╔╝██╔═══██╗██║   ██║    ██╔══██╗██╔══██╗██╔════╝    ██╔══██╗    ██║    ██║██║╚══███╔╝██╔══██╗██╔══██╗██╔══██╗
          ╚████╔╝ ██║   ██║██║   ██║    ███████║██████╔╝█████╗      ███████║    ██║ █╗ ██║██║  ███╔╝ ███████║██████╔╝██║  ██║
          ╚██╔╝  ██║   ██║██║   ██║    ██╔══██║██╔══██╗██╔══╝      ██╔══██║    ██║███╗██║██║ ███╔╝  ██╔══██║██╔══██╗██║  ██║
          ██║   ╚██████╔╝╚██████╔╝    ██║  ██║██║  ██║███████╗    ██║  ██║    ╚███╔███╔╝██║███████╗██║  ██║██║  ██║██████╔╝
          ╚═╝    ╚═════╝  ╚═════╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝    ╚═╝  ╚═╝     ╚══╝╚══╝ ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝
          ".red
          puts "\n"
          puts "You WIN!"
          exit
        end

      else
        wrong_guess << letter
        # puts "You've already guessed these letters:".red
        # p wrong_guess
        puts "Try again!"
        @tries -= 1
      end
    end

    if @tries == 0
      puts "      .--.          " + "                    " + "             "
      puts "      |  |          " + "                    " + "             "
      puts "      MMMM          " + "                    " + "     /       ".blink
      puts "     /MMMMMMMMMO====" + "                    " + "        *    ".blink
      puts "    /MMMMM\\MMMM    " + "                    " + "           / ".blink
      puts "   /MMMMM   \\MM    " + "                    " + "    \\        ".blink
      puts "  /MMMMMM     \\    " + "                    " + "       "+"##".black.on_green+"    "
      puts " /MMMMMMM           " + "                    " + "   * ".blink+"####".black.on_green+"  * ".blink
      puts "/MMMMMMMM           " + "                    " + "    "+"#######".black.on_green+"  "
      puts "\n"
      puts '                  ______                    '.red.on_black.blink
      puts '               .-"      "-.                 '.red.on_black.blink
      puts '              /            \                '.yellow.on_black.blink
      puts ' _           |              |          _    '.yellow.on_black.blink
      puts '( \          |,  .-.  .-.  ,|         / )   '.light_green.on_black.blink
      puts ' > "=._      | )(__/  \__)( |     _.=" <    '.light_green.on_black.blink
      puts '(_/"=._"=._ |/     /\     \| _.="_.="\_)    '.green.on_black.blink
      puts '        "=._ (_     ^^     _)"_.="          '.green.on_black.blink
      puts '            "=\__|IIIIII|__/="              '.cyan.on_black.blink
      puts '           _.="| \IIIIII/ |"=._             '.cyan.on_black.blink
      puts ' _     _.="_.="\          /"=._"=._     _   '.blue.on_black.blink
      puts '( \_.="_.="     `--------`     "=._"=._/ )  '.blue.on_black.blink
      puts ' > _.="                            "=._ <   '.magenta.on_black.blink
      puts '(_/                                    \_)  '.magenta.on_black.blink
      puts "Game over!"
      exit
    end

  end

end

game = WordGuess.new
game.word_bank
