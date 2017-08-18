require_relative 'word_class.rb'
require_relative 'cactus.rb'

new_game = WordClass.new
new_image = Cactus.new
new_game.start_game

puts "THIS IS FOR DEBUGGING! THE WORD IS: #{new_game.word}"#just for debugging

# puts "\n**************************************************".colorize(:white)
puts "\n****************  COWBOY CACTUS  ****************\n".colorize(:white)
# puts "**************************************************\n\n".colorize(:white)

puts "I have taken the Cowboy Cactus hostage and it is up to you to save him.\nI am thinking of a word that has #{new_game.word.length} letters.\nTo save the Cowboy Cactus you must guess the word.\nYou must guess single letters in the alphabet to solve the word.\nThe Cowboy Cactus has six lives and every incorrect guess costs Cowboy Cactus a life.\nIt is up to you to save Cowboy Cactus!".colorize(:white)

game = "on"
while game == "on"
  30.times do |n|
    # puts "\n\n**************************************************".colorize(:white)
    puts "\n*************** Lives: #{6-new_game.guess_count}/6 ****************".colorize(:white)
    # puts "**************************************************".colorize(:white)
    puts new_image.show_ascii(new_game.guess_count)
    puts "\n\n"
    new_game.output_gameboard
    new_game.turn
  end

end
