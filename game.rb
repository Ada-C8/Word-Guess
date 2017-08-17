require 'random_word_generator'

class Word

  attr_accessor :blank_word

 def initialize
   @word = "hello"#RandomWordGenerator.of_length(4)
   @split_word = @word.split("")
   @blank_word = Array.new(5, "_ ")
   @letters = ("a".."z").to_a
   @balloons = [1, 2, 3, 4, 5, 6]
 end

 def guess

   i = 0

   while i < 6
     puts "Please guess a letter: "
     puts "Choose from #{@letters}"
     input = gets.chomp.downcase #check input

     until @letters.include?(input)
       puts "Please only guess from these letters: #{@letters}"
       input = gets.chomp.downcase
     end

     if @split_word.include?(input)
       puts "YAY" #ASCII Art
       show_letter(input)
       puts display_word

     else
       puts "Balloon Pop" #ASCII Art
       i += 1
       @balloons.pop
       puts display_word
     end

     @letters.delete(input)
     if @blank_word == @split_word
       break
     end
     puts "#{@letters}"
   end

   if @blank_word == @split_word
     puts "You WON!"
   else
     puts "YOU LOSE. The word was #{@word}"
   end
 end


 def display_word
   puts "Word: #{@blank_word.join}"
   puts "#{@balloons}"#ASCII art
 end

 def show_letter(element)
   @split_word.each_with_index do |letter, index|
     if letter == element
       @blank_word[index] = element
     end
   end
   return @blank_word
 end

end #end of class

game = Word.new

puts game.display_word

game.guess
