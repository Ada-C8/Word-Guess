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
                          Four Wrong

           ____                              ____
         o8%8888,                          o8%8888,
       o88%8888888.                      o88%8888888.
      8'-    -:8888b                    8'-    -:8888b
     8'         8888                   8'         8888
    d8.-=. ,==-.:888b                 d8.-=. ,==-.:888b
    >8`88P    88P'd8888                 >8 `~` :`~' d8888
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
          puts "                                  _______
                           _,,ad8888888888bba,_
                        ,ad88888I888888888888888ba,
                      ,88888888I88888888888888888888a,
                    ,d888888888I8888888888888888888888b,
                   d8888PP       YY88888888888888888888b,
                 ,d88 __,,--------,,,,.;ZZZY8888888888888,
                ,8IIl                 ;;l ZZZIII8888888888,
               ,I88l;'                  ;lZZZZZ888III8888888,
             ,II88Zl;.                  ;llZZZZZ888888I888888,
            ,II888Zl;.                .;;;;;lllZZZ888888I8888b
           ,II8888Z;;                 `;;;;;''llZZ8888888I8888,
           II88888Z;'                        .;lZZZ8888888I888b
           II88888Z; _,aaa,      .,aaaaa,__.l;llZZZ88888888I888
           II88888IZZZZZZZZZ,  .ZZZZZZZZZZZZZZ;llZZ88888888I888,
           II88888IZZ<'(@@>Z|  |ZZZ<'(@@>ZZZZ;;llZZ888888888I88I
          ,II88888;   `   ;|  |ZZ; `      ;;llZ8888888888I888
          II888888l            `;;          .;llZZ8888888888I888,
         ,II888888Z;           ;;;        .;;llZZZ8888888888I888I
         III888888Zl;    ..,   `;;       ,;;lllZZZ88888888888I888
         II88888888Z;;...;(_    _)      ,;;;llZZZZ88888888888I888,
         II88888888Zl;;;;;' `--'Z;.   .,;;;;llZZZZ88888888888I888b
         ]I888888888Z;;;;'    ;llllll;..;;;lllZZZZ88888888888I8888,
         II888888888Zl.;; Y88bd888P ;;,..;lllZZZZZ88888888888I8888I
         II8888888888Zl;.; `PPP ;;;,..;lllZZZZZZZ88888888888I88888
         II888888888888Zl;;. `;;;l;;;;lllZZZZZZZZW88888888888I88888
         `II8888888888888Zl;.    ,;;lllZZZZZZZZWMZ88888888888I88888
          II8888888888888888ZbaalllZZZZZZZZZWWMZZZ8888888888I888888,
          `II88888888888888888b WWZZZZZWWWMMZZZZZZI888888888I888888b
           `II88888888888888888;ZZMMMMMMZZZZZZZZllI888888888I8888888
            `II8888888888888888 `;lZZZZZZZZZZZlllll888888888I8888888,
             II8888888888888888, `;lllZZZZllllll;;.Y88888888I8888888b,
            ,II8888888888888888b   .;;lllllll;;;.;..88888888I88888888b,
            II888888888888888PZI;.  .`;;;.;;;..; ...88888888I8888888888,
            II888888888888PZ;;';;.   ;. .;.  .;. .. Y8888888I88888888888b,
           ,II888888888PZ;;'                        `8888888I8888888888888b,
           II888888888'                              888888I8888888888888888b
          ,II888888888                              ,888888I88888888888888888
         ,d88888888888                              d888888I8888888888ZZZZZZZ
      ,ad888888888888I                              8888888I8888ZZZZZZZZZZZZZ
    ,d888888888888888'                              888888IZZZZZZZZZZZZZZZZZZ
  ,d888888888888P'8P'                               Y888ZZZZZZZZZZZZZZZZZZZZZ
 ,8888888888888,                                   ,ZZZZZZZZZZZZZZZZZZZZZZZZ
d888888888888888,                                ,ZZZZZZZZZZZZZZZZZZZZZZZZZZZ
888888888888888888a,      _                    ,ZZZZZZZZZZZZZZZZZZZZ888888888
888888888888888888888ba,_d'                  ,ZZZZZZZZZZZZZZZZZ88888888888888
8888888888888888888888888888bbbaaa,,,______,ZZZZZZZZZZZZZZZ888888888888888888
88888888888888888888888888888888888888888ZZZZZZZZZZZZZZZ888888888888888888888
8888888888888888888888888888888888888888ZZZZZZZZZZZZZZ88888888888888888888888
888888888888888888888888888888888888888ZZZZZZZZZZZZZZ888888888888888888888888
8888888888888888888888888888888888888ZZZZZZZZZZZZZZ88888888888888888888888888
88888888888888888888888888888888888ZZZZZZZZZZZZZZ8888888888888888888888888888
8888888888888888888888888888888888ZZZZZZZZZZZZZZ88888888888888888 Normand  88
88888888888888888888888888888888ZZZZZZZZZZZZZZ8888888888888888888 Veilleux 88
8888888888888888888888888888888ZZZZZZZZZZZZZZ88888888888888888888888888888888
This is your last chance"
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
