require 'faker'
require 'colorize'
require 'artii'



class Word
  attr_accessor :random_word, :word_display, :num_bad_guess, :bad_letters, :letter, :num_good_guess
  def initialize (random_word)
    @random_word = random_word.split("")
    @word_display = Array.new(random_word.length, "_ ") #make array of underscores
    @num_bad_guess = 0 #had to give it initial val so that we cound increment it with count bad guess method
    @num_good_guess = 0
    @bad_letters = []
  end

  def reveal(letter)
    @letter = letter
    counter = 0 # keeps track of random word index number
    @changed = nil
    @random_word.each do |alpha|
      if alpha == @letter
        @word_display[counter] = @letter
        @changed = true # indicates that guess was right
      end
      counter += 1
    end
    return @word_display
  end

  def count_bad_guess
    unless @letter == @random_word.join("")
      if @changed == nil #checks to see if guess was wrong
        @num_bad_guess += 1 # if guess is wrong increments bad guess otherwise  gives "free" guess
        @bad_letters << @letter
        puts "\nNumber of failed guesses: #{@num_bad_guess}"
        puts "Letters you have guessed: #{@bad_letters.join(", ")}." #prints to user how many bad guesses they took
      end
      return @num_bad_guess #otherwise method returns nil
    end
  end

  def count_good_guess
    if @changed == true
      @num_good_guess += 1
    end
    return @num_good_guess
  end
end

class Art
  attr_accessor :num_good_guess, :part1, :part2, :part3, :part4, :part5, :part6, :part7
  def initialize
    @part1 = "        ....                                ....            
           ... . . .........    .. .    .. .  ......... .. . .         
           MMMMMMMMM8I~....:~7DMMMMMMMMMDDMMMMMMMMM$+~~~~~IOMMMMMMMMMM.
           MMMMM=.              ...MMMMMMMMMMN..           . .  MMMMMM. "
    @part2 = "        ....                                ....            
           ... . . .........    .. .    .. .  ......... .. . .         
           MMMMMMMMM8I~....:~7DMMMMMMMMMDDMMMMMMMMM$+~~~~~IOMMMMMMMMMM.
           MMMMM=.              ...MMMMMMMMMMN..           . .  MMMMMM.
          .MMMM                    DMMMMMMM7                    MMMM~ 
             MMN                   .~MM .:MM                   ..MMM   
             .MM                   .IM?...NM.                  ..MM .  
              :M                   .MM.  ..M8                  .,M.     "
    @part3 = "        ....                                ....            
           ... . . .........    .. .    .. .  ......... .. . .         
           MMMMMMMMM8I~....:~7DMMMMMMMMMDDMMMMMMMMM$+~~~~~IOMMMMMMMMMM.
           MMMMM=.              ...MMMMMMMMMMN..           . .  MMMMMM.
          .MMMM                    DMMMMMMM7                    MMMM~ 
             MMN                   .~MM .:MM                   ..MMM   
             .MM                   .IM?...NM.                  ..MM .  
              :M                   .MM.  ..M8                  .,M.    
                MM..                .M,.  . 8M..                .MM.    
               .M$.               ,MZ..    .MM.              ..OM..    
                 MM....    ......,M?.        MM....    .......MM       
                  8MM+.........MMM. .          MM?...  .....MM8..       "
    @part4 = "        ....                                ....            
           ... . . .........    .. .    .. .  ......... .. . .         
           MMMMMMMMM8I~....:~7DMMMMMMMMMDDMMMMMMMMM$+~~~~~IOMMMMMMMMMM.
           MMMMM=.              ...MMMMMMMMMMN..           . .  MMMMMM.
          .MMMM                    DMMMMMMM7                    MMMM~ 
             MMN                   .~MM .:MM                   ..MMM   
             .MM                   .IM?...NM.                  ..MM .  
              :M                   .MM.  ..M8                  .,M.    
                MM..                .M,.  . 8M..                .MM.    
               .M$.               ,MZ..    .MM.              ..OM..    
                 MM....    ......,M?.        MM....    .......MM       
                  8MM+.........MMM. .          MM?...  .....MM8..      
                    ...ZMMMMN$.....            ...?MMMMMMM=....        
                                                                       
                        .   ..   ...  .  .                      
                                MMMMMMM  .MMMMMMM                       "
    @part5 = "        ....                                ....            
           ... . . .........    .. .    .. .  ......... .. . .         
           MMMMMMMMM8I~....:~7DMMMMMMMMMDDMMMMMMMMM$+~~~~~IOMMMMMMMMMM.
           MMMMM=.              ...MMMMMMMMMMN..           . .  MMMMMM.
          .MMMM                    DMMMMMMM7                    MMMM~ 
             MMN                   .~MM .:MM                   ..MMM   
             .MM                   .IM?...NM.                  ..MM .  
              :M                   .MM.  ..M8                  .,M.    
                MM..                .M,.  . 8M..                .MM.    
               .M$.               ,MZ..    .MM.              ..OM..    
                 MM....    ......,M?.        MM....    .......MM       
                  8MM+.........MMM. .          MM?...  .....MM8..      
                    ...ZMMMMN$.....            ...?MMMMMMM=....        
                                                                       
                        .   ..   ...  .  .                      
                                MMMMMMM  .MMMMMMM                           
                  ....       MMMMMMMMMMMMMMMMMMMMM        ....        
                 MM..?.  ..,MMMMMMMMMMMMMMMMMMMMMMMMM.     $..MM       
               .MM.    . .NMMMMMMMMMMMMMMMMMMMMMMMMMMMM..  ....MM .    
               MMM.   .?MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM~.....MM?      "
    @part6 = "        ....                                ....            
           ... . . .........    .. .    .. .  ......... .. . .         
           MMMMMMMMM8I~....:~7DMMMMMMMMMDDMMMMMMMMM$+~~~~~IOMMMMMMMMMM.
           MMMMM=.              ...MMMMMMMMMMN..           . .  MMMMMM.
          .MMMM                    DMMMMMMM7                    MMMM~ 
             MMN                   .~MM .:MM                   ..MMM   
             .MM                   .IM?...NM.                  ..MM .  
              :M                   .MM.  ..M8                  .,M.    
                MM..                .M,.  . 8M..                .MM.    
               .M$.               ,MZ..    .MM.              ..OM..    
                 MM....    ......,M?.        MM....    .......MM       
                  8MM+.........MMM. .          MM?...  .....MM8..      
                    ...ZMMMMN$.....            ...?MMMMMMM=....        
                                                                       
                        .   ..   ...  .  .                      
                                MMMMMMM  .MMMMMMM                           
                  ....       MMMMMMMMMMMMMMMMMMMMM        ....        
                 MM..?.  ..,MMMMMMMMMMMMMMMMMMMMMMMMM.     $..MM       
               .MM.    . .NMMMMMMMMMMMMMMMMMMMMMMMMMMMM..  ....MM .    
               MMM.   .?MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM~.....MM?         
              .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM .    
                .MMMMMMMMMMMMMMMMMMMMMM8 NMMMMMMMMMMMMMMMMMMMMMM       
                 . 7MMMMMMMMMMMMMMMMM.   . :MMMMMMMMMMMMMMMMM?         
                     ...=I77?=,   .              .:=I77+~               "
    @part7 = "        ....                                ....            
           ... . . .........    .. .    .. .  ......... .. . .         
           MMMMMMMMM8I~....:~7DMMMMMMMMMDDMMMMMMMMM$+~~~~~IOMMMMMMMMMM.
           MMMMM=.              ...MMMMMMMMMMN..           . .  MMMMMM.
          .MMMM                    DMMMMMMM7                    MMMM~ 
             MMN                   .~MM .:MM                   ..MMM   
             .MM                   .IM?...NM.                  ..MM .  
              :M                   .MM.  ..M8                  .,M.    
                MM..                .M,.  . 8M..                .MM.    
               .M$.               ,MZ..    .MM.              ..OM..    
                 MM....    ......,M?.        MM....    .......MM       
                  8MM+.........MMM. .          MM?...  .....MM8..      
                    ...ZMMMMN$.....            ...?MMMMMMM=....        
                                                                       
                        .   ..   ...  .  .                      
                                MMMMMMM  .MMMMMMM                           
                  ....       MMMMMMMMMMMMMMMMMMMMM        ....        
                 MM..?.  ..,MMMMMMMMMMMMMMMMMMMMMMMMM.     $..MM       
               .MM.    . .NMMMMMMMMMMMMMMMMMMMMMMMMMMMM..  ....MM .    
               MMM.   .?MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM~.....MM?         
              .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM .    
                .MMMMMMMMMMMMMMMMMMMMMM8 NMMMMMMMMMMMMMMMMMMMMMM       
                 . 7MMMMMMMMMMMMMMMMM.   . :MMMMMMMMMMMMMMMMM?         
                     ...=I77?=,   .              .:=I77+~              
                      .. . .  ....                  .  .               
                                                   ....                
                                                                        "
  end

  def display(num_good_guess)
    case num_good_guess
    when 1
      puts @part1
    when 2
      puts @part2
    when 3
      puts @part3
    when 4
      puts @part4
    when 5
      puts @part5
    when 6
      puts @part6
    when 7
      puts @part7
    end
  end
end

class Game
  attr_accessor :random_word, :word_display, :num_bad_guess, :bad_letters, :letter, :num_good_guess, :part1
  def initialize


    #when guesses_taken > guesses_allowed  game over
    #or
    #when guesses_taken == guesses_allowed && word_display.includes? " _ " game over
    #when guesses_taken == guesses_allowed && random_word != word_display game over
  end

  def play
    word = Word.new(Faker::Hipster.unique.word.downcase)
    @bad_guess_allowed = word.random_word.length + 3
print word.random_word.join("")
    while true
      print "\nLetter guess: "
      guess = gets.chomp.downcase
      print word.reveal(guess).join
      @num_bad_guess = word.count_bad_guess
      @num_good_guess = word.count_good_guess
      puts @num_good_guess
      Art.new.display(@num_good_guess)
      if word.random_word == word.word_display  || guess == word.random_word.join("")
        #check for the 'win condition'
        puts "\e[H\e[2J"
        puts "\nCongrats! You guessed the word AND you look the part!"
        Art.new.display(7)
        break
      end
      if @num_bad_guess == @bad_guess_allowed #if this happens the 'win condition', you lost :disappointed:
        puts "\nSorry, you're out of guesses! The word was #{word.random_word.join("")}. Guess you didn't know the word before it was cool."
        break
      end
    end
  end
end

puts "Welcome to Artisanal Haaang Maaaaan. Words are single-origin blah ...... "

word = Game.new.play

#
# print "        ....                                ....            
#        ... . . .........    .. .    .. .  ......... .. . .         
#        MMMMMMMMM8I~....:~7DMMMMMMMMMDDMMMMMMMMM$+~~~~~IOMMMMMMMMMM.
#        MMMMM=.              ...MMMMMMMMMMN..           . .  MMMMMM.
#       .MMMM                    DMMMMMMM7                    MMMM~ 
#          MMN                   .~MM .:MM                   ..MMM   
#          .MM                   .IM?...NM.                  ..MM .  
#           :M                   .MM.  ..M8                  .,M.    
#             MM..                .M,.  . 8M..                .MM.    
#            .M$.               ,MZ..    .MM.              ..OM..    
#              MM....    ......,M?.        MM....    .......MM       
#               8MM+.........MMM. .          MM?...  .....MM8..      
#                 ...ZMMMMN$.....            ...?MMMMMMM=....        
#                                                                    
#                     .   ..   ...  .  .                      
#                             MMMMMMM  .MMMMMMM                           
#               ....       MMMMMMMMMMMMMMMMMMMMM        ....        
#              MM..?.  ..,MMMMMMMMMMMMMMMMMMMMMMMMM.     $..MM       
#            .MM.    . .NMMMMMMMMMMMMMMMMMMMMMMMMMMMM..  ....MM .    
#            MMM.   .?MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM~.....MM?         
#           .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM .    
#             .MMMMMMMMMMMMMMMMMMMMMM8 NMMMMMMMMMMMMMMMMMMMMMM       
#              . 7MMMMMMMMMMMMMMMMM.   . :MMMMMMMMMMMMMMMMM?         
#                  ...=I77?=,   .              .:=I77+~              
#                   .. . .  ....                  .  .               
#                                                ....                
#                                                                     "
