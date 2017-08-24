require 'colorize'

def five
  puts "
    ,d88b.d88b,    ,d88b.d88b,    ,d88b.d88b,    ,d88b.d88b,    ,d88b.d88b,
    88888888888    88888888888    88888888888    88888888888    88888888888
    `Y8888888Y'    `Y8888888Y'    `Y8888888Y'    `Y8888888Y'    `Y8888888Y'
      `Y888Y'        `Y888Y'        `Y888Y'        `Y888Y'        `Y888Y'
        `Y'            `Y'            `Y'            `Y'            `Y'".colorize(:red)
  end

def four
  puts "
    ,d88b.d88b,    ,d88b.d88b,    ,d88b.d88b,    ,d88b.d88b,
    88888888888    88888888888    88888888888    88888888888
    `Y8888888Y'    `Y8888888Y'    `Y8888888Y'    `Y8888888Y'
      `Y888Y'        `Y888Y'        `Y888Y'        `Y888Y'
        `Y'            `Y'            `Y'            `Y'".colorize(:magenta)
end

def three
  puts "
    ,d88b.d88b,    ,d88b.d88b,    ,d88b.d88b,
    88888888888    88888888888    88888888888
    `Y8888888Y'    `Y8888888Y'    `Y8888888Y'
      `Y888Y'        `Y888Y'        `Y888Y'
        `Y'            `Y'            `Y'".colorize(:light_red)
end

def two
  puts "
    ,d88b.d88b,    ,d88b.d88b,
    88888888888    88888888888
    `Y8888888Y'    `Y8888888Y'
      `Y888Y'        `Y888Y'
        `Y'            `Y'".colorize(:light_yellow)
end

def one
  puts "
    ,d88b.d88b,
    88888888888
    `Y8888888Y'
      `Y888Y'
        `Y'".colorize(:white)
end


def you_win
  puts "
    _.-'''''-._
  .'  _     _  '.
 '   (o)   (o)   '
|                 |
|                 |
'   '.       .'  '
  '.  `'---'`  .'
    '-._____.-'".colorize(:yellow)
end

def you_lose
  puts "
      .- - - - .
     '          '.
   '   O      O   '
  :           `    :
  |                |
  :    .------.    :
   '  '        '  '
    '.          .'
      '-......-'".colorize(:light_cyan)
end


#######CODE BELOW IS BEFORE WE ADDED IN COLOR TO THE ART!
# require 'colorize'
#
#
#
# def five
# five_guesses = <<'TEXT'
#   ,d88b.d88b,    ,d88b.d88b,    ,d88b.d88b,    ,d88b.d88b,    ,d88b.d88b,
#   88888888888    88888888888    88888888888    88888888888    88888888888
#   `Y8888888Y'    `Y8888888Y'    `Y8888888Y'    `Y8888888Y'    `Y8888888Y'
#     `Y888Y'        `Y888Y'        `Y888Y'        `Y888Y'        `Y888Y'
#       `Y'            `Y'            `Y'            `Y'            `Y'
#
# TEXT
# end
#
#
#
# def four
# four_guesses = <<'TEXT'
#   ,d88b.d88b,    ,d88b.d88b,    ,d88b.d88b,    ,d88b.d88b,
#   88888888888    88888888888    88888888888    88888888888
#   `Y8888888Y'    `Y8888888Y'    `Y8888888Y'    `Y8888888Y'
#     `Y888Y'        `Y888Y'        `Y888Y'        `Y888Y'
#       `Y'            `Y'            `Y'            `Y'
#
# TEXT
# end
#
# def three
# three_guesses = <<'TEXT'
#   ,d88b.d88b,    ,d88b.d88b,    ,d88b.d88b,
#   88888888888    88888888888    88888888888
#   `Y8888888Y'    `Y8888888Y'    `Y8888888Y'
#     `Y888Y'        `Y888Y'        `Y888Y'
#       `Y'            `Y'            `Y'
#
# TEXT
# end
#
# def two
# two_guesses = <<'TEXT'
#   ,d88b.d88b,    ,d88b.d88b,
#   88888888888    88888888888
#   `Y8888888Y'    `Y8888888Y'
#     `Y888Y'        `Y888Y'
#       `Y'            `Y'
#
# TEXT
# end
#
# def one
# one_guesses = <<'TEXT'
#   ,d88b.d88b,
#   88888888888
#   `Y8888888Y'
#     `Y888Y'
#       `Y'
#
# TEXT
# end
#
#
# def you_win
#   winning = <<'TEXT'
#     _.-'''''-._
#   .'  _     _  '.
#  /   (o)   (o)   \
# |                 |
# |  \           /  |
#  \  '.       .'  /
#   '.  `'---'`  .'
#     '-._____.-'
# TEXT
# end
#
# def you_lose
#   losing = <<'TEXT'
#     .-""""""-.
#    '          '.
#  /   O      O   \
# :           `    :
# |                |
# :    .------.    :
#  \  '        '  /
#   '.          .'
#     '-......-'
# TEXT
# end
