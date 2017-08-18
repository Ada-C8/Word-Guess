require 'artii'
require 'colorize'

class Hangman
  attr_accessor :guesses, :word, :hidden_word, :wrongs

  def initialize
    @guesses = []
    @word = "" #pick word random from dictionary
    @hidden_word = []
    @wrongs = 0
    @fails = 0
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
    if @word.include?(guess)
      puts "Good Guess"
      # add letter to hidden_word
      replace_hidden_with_letter(guess)
      #################
      @hidden_word
    else # ascii minus something
      @fails += 1
    end
  end # End letter_included


  def pick_a_letter

    while @word.split("") != @hidden_word

      puts "pick a letter"
      letter_guess = gets.chomp.capitalize

      case
      when !!(letter_guess =~ /[A-Z]/) && !@guesses.include?(letter_guess)
        @guesses << letter_guess
        letter_included(letter_guess)

        case
        when @word.split("") == @hidden_word
          win = Artii::Base.new
          puts win.asciify('Winner Winner').colorize(:magenta)
          puts win.asciify(@word).colorize(:cyan)
        when @fails == 1
          puts "          one wrong
        o8%8888,
      o88%8888888.
     8'-    -:8888b
    8'         8888
   d8.-=. ,==-.:888b
   >8 `~` :`~' d8888
   88         ,88888
   88b. `-~  ':88888
   888b ~==~ .:88888
   88888o--:':::8888
   `88888| :::' 8888b
   8888^^'       8888b
  d888           ,%888b.
 d88%            %%%8--'-.
/88:.__ ,       _%-' ---  -
    '''::===..-'   =  --."
          #ascii 1
        when @fails == 2
          #ascii 2
          puts "        o8%8Two,                          o8Wrong,
       o88%8888888.                      o88%8888888.
      8'-    -:8888b                    8'-    -:8888b
     8'         8888                   8'         8888
    d8.-=. ,==-.:888b                 d8.-=. ,==-.:888b
    >8 `~` :`~' d8888                 >8 `=` :`=' d8888
    88         ,88888                 88         ,88888
    88b. `-~  ':88888                 88b` `--  ':88888
    888b ~==~ .:88888                 888b -==- .:88888
    88888o--:':::8888                 88888o--:':::8888
    `88888| :::' 8888b                `88888| :::' 8888b
    8888^^'       8888b               8888^^'       8888b
   d888           ,%888b.            d888           ,%888b.
  d88%            %%%8--'-.         d88%            %%%8--'-.
 /88:.__ ,       _%-' ---  -       /88:.__ ,       _%-' ---  -
     '''::===..-'   =  --.  `          '''::===..-'   =  --.  `"
        when @fails == 3
          #ascii 3
          puts "
           ____
         o8%8888,
       o88%8888888.
      8'-    -:8888b
     8'         8888
    d8.-=. ,==-.:888b
    >8 `~` :`~' d8888
    88         ,88888
    88b. `-~  ':88888
    888b v=v~ .:88888
    88888o--:':::8888
    `88888| :::' 8888b
    8888^^'       8888b
   d888           ,%888b.
  d88%            %%%8--'-.
 /88:.__ ,       _%-' ---  -
     '''::===..-'   =  --.  `


           ____                            .------.
         o8%8888,                         /        \
       o88%8888888.                     .' Three    `.
  '   8'-    -:8888b             _______|___Wrong_____|
 :   8'         8888                  8           8888
` ' d8.-=. ,==-.:888b                 d8.-=. ,==-.:888b
 `  >8 `~` :`~' d8888                 >8 `~` :`~' d8888
`:: 88         ,88888                 88         ,88888
 `' 88b. `-~  ':88888                 88b. `-~  ':88888
  `eeeeeee==~ .:88888                 888b ~==~ .:88888
    88888o--:':::8888                 88888o--:':::8888
    `88888| :::' 8888b                `88888| :::' 8888b
    8888^^'       8888b               8888^^'       8888b
   d888           ,%888b.            d888           ,%888b.
  d88%            %%%8--'-.         d88%            %%%8--'-.
 /88:.__ ,       _%-' ---  -       /88:.__ ,       _%-' ---  -
     '''::===..-'   =  --.  `          '''::===..-'   =  --.  `
"

        when @fails == 4
          # ascii 4
          puts "           ____                              ____
         o8%8888,                          o8%8888,
       o88%8888888.                      o88%8888888.
      8'-    -:8888b                    8'-    -:8888b
     8'         8888                   8'         8888
    d8.-=. ,==-.:888b                 d8.-=. ,==-.:888b
    >8 `~` :`~' d8888                 >8 `=` :`=' d8888
    88         ,88888                 88         ,88888
    88b. `-~  ':88888                 88b` `--  ':88888
    888b ~==~ .:88888                 888b -==- .:88888
    88888o--:':::8888                 88888o--:':::8888
    `88888| :::' 8888b                `88888| :::' 8888b
    8888^^'       8888b               8888^^'       8888b
   d888           ,%888b.            d888           ,%888b.
  d88%            %%%8--'-.         d88%            %%%8--'-.
 /88:.__ ,       _%-' ---  -       /88:.__ ,       _%-' ---  -
     '''::===..-'   =  --.  `          '''::===..-'   =  --.  `
      Normal Mona                      Depressed Mona

           ____                              ____
         o8%8888,                          o8%8888,
       o88%8888888.                      o88%8888888.
      8'-    -:8888b                    8'-    -:8888b
     8'         8888                   8'         8888
    d8.-=. ,==-.:888b                 d8.-=. ,==-.:888b
    >8`88P  88P'd8888                 >8 `~` :`~' d8888
    88         ,88888                 88         ,88888
    88b. `-~  ':88888                 88b. `-~  ':88888
    888b ~==~ .:88888                 888b .==. .:88888
    88888o--:':::8888                 88888o--:':::8888
    `88888| :::' 8888b                `88888| :::' 8888b
    8888^^'       8888b               8888^^'       8888b
   d888           ,%888b.            d888           ,%888b.
  d88%            %%%8--'-.         d88%            %%%8--'-.
 /88:.__ ,       _%-' ---  -       /88:.__ ,       _%-' ---  -
     '''::===..-'   =  --.  `          '''::===..-'   =  --.  `"
        when @fails == 5
          # ascii 5
        when @fails == 6
          lose = Artii::Base.new
          puts lose.asciify('Sorry, You Lose').colorize(:red)

          exit
        else #no fails yet
        end
        puts "#{hidden_word}"
      else
        puts "No, pick another letter."
      end
      # guesses << pick_a_letter
      # letter_included(letter_guess)
    end
  end

end # End of Hangman
