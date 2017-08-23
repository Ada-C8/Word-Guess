class Cactus
  attr_reader :ascii

  def initialize
    @ascii = ["
                  _   _
                 / \'_\' \\
                ;       ;
             /\'-|       |-\'\\
            |   |_______|   |
            \\   '-------'   /
             '.___.....___.'
                | ;  : ;|
               _|;__;__.|_
              |     Y     |    .--.
     .--.      \\__.'^'.__/    /;   \\
    /   ;\\      |_  ;  _|     |  ' |
    | ;  |      { \`\"\"\"\` }     |;   |
    |'   |      {       }     | ;  |
    |;   |      ;`-.__.'|     |:  ;|
    | ;  \\      |;  ;   |_____/ ;  |
    |   '.'-----'      ' -_   .'   /
    \\  '.   - _  ' ;  ;  _  -    .'
     '.   -     - ;  ;   .------`
       `--------.      ;|
                |;  ,   |
                |     ; |
                |. ;    |
                | :    :|
                |   .   |
                |;   ;  |
                |;  ,   |
                |     ; |
                |. ;    |
                | :    :|
                |   .   |
                |;   ;  |
                |;  ,   |
                |     ; |
                |     ; |
                |. ;    |
                | :    :|
                |   .   |
                |;   ;  |
                `\"-----\"` ", "
                  _   _
                 / \'_\' \\
                ;       ;
             /\'-|       |-\'\\
            |   |_______|   |
            \\   '-------'   /
             '.___.....___.'
                | ;  : ;|
               _|;__;__.|_
              |     Y     |    .--.
     .--.      \\__.'^'.__/    /;   \\
    /   ;\\      |_  ;  _|     |  ' |
    | ;  |      { \`\"\"\"\` }     |;   |
    |'   |      {       }     | ;  |
    |;   |      ;`-.__.'|     |:  ;|
    | ;  \\      |;  ;   |_____/ ;  |
    |   '.'-----'      ' -_   .'   /
    \\  '.   - _  ' ;  ;  _  -    .'
     '.   -     - ;  ;   .------`
       `--------.      ;|
                |;  ,   |
                |     ; |
                |. ;    |
                | :    :|
                |   .   |
                |;   ;  |
                |;  ,   |
                |     ; |
                |. ;    |
                \`\"-----\"\`", "
                  _   _
                 / \'_\' \\
                ;       ;
             /\'-|       |-\'\\
            |   |_______|   |
            \\   '-------'   /
             '.___.....___.'
                | ;  : ;|
               _|;__;__.|_
              |     Y     |    .--.
     .--.      \\__.'^'.__/    /;   \\
    /   ;\\      |_  ;  _|     |  ' |
    | ;  |      { \`\"\"\"\` }     |;   |
    |'   |      {       }     | ;  |
    |;   |      ;`-.__.'|     |:  ;|
    | ;  \\      |;  ;   |_____/ ;  |
    |   '.'-----'      ' -_   .'   /
    \\  '.   - _  ' ;  ;  _  -    .'
     '.   -     - ;  ;   .------`
       `--------.      ;|
                `\"-----\"` ",
    "
                 .-----.
                /;  ;   \\
                | ;  : ;|
               _|;__;__.|_
              |     Y     |    .--.
     .--.      \\__.'^'.__/    /;   \\
    /   ;\\      |_  ;  _|     |  ' |
    | ;  |      { \`\"\"\"\` }     |;   |
    |'   |      {       }     | ;  |
    |;   |      ;`-.__.'|     |:  ;|
    | ;  \\      |;  ;   |_____/ ;  |
    |   '.'-----'      ' -_   .'   /
    \\  '.   - _  ' ;  ;  _  -    .'
     '.   -     - ;  ;   .------`
       `--------.      ;|
                `\"-----\"` ",
                "
                 .-----.
                /;  ;   \\
                | ;  : ;|
               _|;__;__.|_
              |     Y     |
     .--.      \\__.'^'.__/
    /   ;\\      |_  ;  _|
    | ;  |      { \`\"\"\"\` }
    |'   |      {       }
    |;   |      ;`-.__.'|
    | ;  \\      |;  ;   |
    |   '.'-----'      '|
    \\  '.   - _  ' ;  ; |
     '.   -     - ;  ;  |
       `--------.      ;|
                `\"-----\"` ",
                "
                 .-----.
                /;  ;   \\
                | ;  : ;|
               _|;__;__.|_
              |     Y     |
               \\__.'^'.__/
                |_  ;  _|
                { \`\"\"\"\` }
                {       }
                ;`-.__.'|
                |;  ;   |
                |'     '|
                | ' ; ; |
                |- ; ;  |
                |.     ;|
                `\"-----\"` ",
                "
                   ______
             _____/      \\_____
            |  _     ___   _   ||
            | | \\     |   | \\  ||
            | |  |    |   |  | ||
            | |_/     |   |_/  ||
            | | \\     |   |    ||
            | |  \\    |   |    ||
            | |   \\. _|_. | .  ||
            |                  ||
            |  COWBOY CACTUS   ||
            |                  ||"
    ]
  end

  def show_ascii(num_wrong_guesses)
    return @ascii[num_wrong_guesses]
  end
end

test_cactus = Cactus.new
#
# puts test_cactus.show_ascii(0)
# puts test_cactus.show_ascii(1)
# puts test_cactus.show_ascii(2)
# puts test_cactus.show_ascii(3)
# puts test_cactus.show_ascii(4)
# puts test_cactus.show_ascii(5)
# puts test_cactus.show_ascii(6)
