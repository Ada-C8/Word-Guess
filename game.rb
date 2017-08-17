require 'random_word_generator'

class Word

  attr_accessor :blank_word

 def initialize
   @word = RandomWordGenerator.of_length(7)
   @split_word = @word.split("")
   @blank_word = Array.new(7, "_")
   @letters = ("a".."z").to_a
 end

 def guess
   puts "Please guess a letter: "
   puts "Choose from #{@letters}"
   input = gets.chomp #check input

   if @split_word.include?(input)
     #new method find letter index in split_word and replace same space in @blanks
     puts "YAY" #ASCII Art
    show_letter(input)
    puts display_word
   else
     puts "Balloon Pop" #ASCII Art

   end

   @letters.delete(input)
   puts "#{@letters}"

 end

 def erase_letter

 end

 def display_word
   puts "Word: #{@blank_word}" #ASCII art
 end

 def show_letter(element)
   #i = 0
   @split_word.each_with_index do |letter, index|

     #i += 1

     if letter == element
       @blank_word[index] = element
     end
   end
   return @blank_word
 end

end #end of class

game = Word.new

puts game.inspect

puts game.display_word

game.guess
