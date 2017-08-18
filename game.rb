require 'random_word_generator'

class Word

  attr_accessor :blank_word, :level

 def initialize(level)
   @word = RandomWordGenerator.of_length(level)
   @split_word = @word.split("")
   @blank_word = Array.new(level, "_ ")
   @letters = ("a".."z").to_a
   @balloons = ["
        ,-\"\"\"\"-.
      ,'      _ `.
     /       )_)  \\
    :              :
    \\              /
     \\            /
      `.        ,'
        `.    ,'
          `.,'
           /\\
               ", "
               ,-\"\"\"\"-.
             ,'      _ `.
            /       )_)  \\
           :              :
           \\              /
            \\            /
             `.        ,'
               `.    ,'
                 `.,'
                  /\\", "
                  ,-\"\"\"\"-.
                ,'      _ `.
               /       )_)  \\
              :              :
              \\              /
               \\            /
                `.        ,'
                  `.    ,'
                    `.,'
                     /\\", "
                     ,-\"\"\"\"-.
                   ,'      _ `.
                  /       )_)  \\
                 :              :
                 \\              /
                  \\            /
                   `.        ,'
                     `.    ,'
                       `.,'
                        /\\", "
                        ,-\"\"\"\"-.
                      ,'      _ `.
                     /       )_)  \\
                    :              :
                    \\              /
                     \\            /
                      `.        ,'
                        `.    ,'
                          `.,'
                           /\\"]
   @level = level
 end

 def guess

   i = 0

   while i < 5
     puts "Please guess a letter, you have #{@balloons.length} guesses remaining: "
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
       i += 1
       @balloons.pop
       puts "You have #{@balloons.length} guesses remaining!"
       puts display_word
     end

     @letters.delete(input)
     if @blank_word == @split_word
       break
     end
     #puts "#{@letters}"
   end

   if @blank_word == @split_word
     puts "You WON!"
   else
     puts "YOU LOSE. The word was #{@word}"
   end
 end

 def display_word
   puts "#{@balloons.join('   ')}"#ASCII art
   puts "Word: #{@blank_word.join}"
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

levels = {LOW:4, MEDIUM:6, HIGH:8}

puts "What level do you want: #{levels.keys.join(', ')} "
answer = gets.chomp.upcase.to_sym

until levels.keys.include?(answer)
  puts "Please choose from these options: #{  levels.keys.join(', ')}"
  answer = gets.chomp.upcase.to_sym
end

game = Word.new(levels[answer])
game.guess
