require_relative 'game'

puts "Do you want to play word guess? (Y or N)"

game_answer = gets.chomp.upcase

until game_answer == 'Y' || game_answer == 'N'
	puts "That's an invalid answer" 
	puts "Do you want to play word guess? (Y or N)"	
	game_answer = gets.chomp.upcase
end

if game_answer == 'Y' 
	new_game = Game.new
elsif game_answer == 'N'
	exit
end

loop do
	puts "Guess a letter"
	letter = gets.chomp.downcase
	letter = letter[0]
	check = /^[A-z]+$/.match(letter)
	if check == nil
		puts "that is an incorrect input, please try again"
	else 
		new_game.guess_letter(letter)
	end

end


