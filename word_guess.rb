require_relative 'word_class.rb'

new_game = WordClass.new
word = new_game.generate_word
puts ###########################
puts "I am thinking of a word that has #{word.length} letters"
puts "Guess the letters in the word I am thinking of."
game = "on"
while game == "on"

  #complete ascii goes here
  puts "Ascii goes here!"
  puts d.output_gameboard
  30.time do |n|
      puts d.turn
  end
end
