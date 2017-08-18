require_relative 'word_class.rb'
require_relative 'cactus.rb'

new_game = WordClass.new
new_image = Cactus.new
new_game.start_game

puts "THIS IS FOR DEBUGGING! THE WORD IS: #{new_game.word}"#just for debugging

puts "\n**************************************************".colorize(:white)
puts "******************  WORD GAMES  ******************".colorize(:white)
puts "**************************************************\n\n".colorize(:white)

puts "I am thinking of a word that has #{new_game.word.length} letters\n".colorize(:white)
puts "Guess letters to see if you can guess the word!".colorize(:white)

game = "on"
while game == "on"
  30.times do |n|
    puts "\n\n**************************************************".colorize(:white)
    puts "***************  #{6-new_game.guess_count} guesses left!  ****************".colorize(:white)
    puts "**************************************************".colorize(:white)
    puts new_image.show_ascii(new_game.guess_count)
    puts "\n\n"
    new_game.output_gameboard
    new_game.turn
  end

end
