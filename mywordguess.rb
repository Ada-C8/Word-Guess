require 'faker'
require 'colorize'

class Word
  attr_reader :random_word, :word_display, :changed

  def initialize(random_word)
    @random_word = random_word.split("")
    @word_display = Array.new(random_word.length, "_ ")
  end

  def reveal(guess)
    counter = 0 #keeps track of random_word array index number
    @changed = nil
    @random_word.each do |char|
      if char == guess
        @word_display[counter] = guess
        @changed = true
      end
      counter += 1
    end
    return @word_display
  end

  def changed? #keeps track of whether word_display changed i.e. whether the guess was right
    return @changed
  end
end

class Art
  attr_reader :part1, :part2, :part3, :part4, :part5, :part6, :part7

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
      return @part1
    when 2
      return @part2
    when 3
      return @part3
    when 4
      return @part4
    when 5
      return @part5
    when 6
      return @part6
    when 7
      return @part7
    end
  end

end

class Game

  def initialize
    @word = Word.new(Faker::Hipster.unique.word.downcase)
    @bad_guess_allowed = 7
    @num_bad_guess = 0
    @num_good_guess = 0
    @bad_letters = []
  end

  def count_bad_guess(guess)
    unless guess == @word.random_word.join("")
      if @changed == nil
        @num_bad_guess += 1
        @bad_letters << guess
        puts "\n\nFutile attempts: #{@num_bad_guess}"
        puts "You’ve already tried: #{@bad_letters.join(", ")}"
      end
      return @num_bad_guess
    end
  end

  def count_good_guess
    if @changed == true
      @num_good_guess += 1 #stores how many good guesses has taken so Art.display can show that many parts of the image
      puts "\n\nGood guess! You're on a roll!"
      puts "You’ve already tried: #{@bad_letters.join(", ")}"
    end
    return @num_good_guess
  end

  def play

    while true
      print "\nGo! "
      print ">> ".blink
      guess = gets.chomp.downcase
      print @word.reveal(guess).join
      @changed = @word.changed?
      @num_bad_guess = count_bad_guess(guess)
      @num_good_guess = count_good_guess
      puts Art.new.display(@num_good_guess)
      if @word.random_word == @word.word_display  || guess == @word.random_word.join("")
        #check for the ‘win condition’
        puts Art.new.display(7).blue.blink
          puts "\nLook at you: you guessed the word and looked good doing it! They're vintage."
        break
      end
      if @num_bad_guess == @bad_guess_allowed #if this happens before the win condition is satisfied, you lose :(
        puts "\nUh-oh! You're out of guesses. The word was ‘#{@word.random_word.join("").capitalize}‘. I used this word for months before it was even cool."
        puts Art.new.display(7).red.blink
        break
      end
    end
  end
end

let_me_help_you = [
  "Not to be a conformist, but there is only one right way to prep chai.",
  "Nope! Hint: You can get a gallon of it at Trader Joe’s, but I doubt it’s organic.",
  "That’s not niche enough."
]
puts "This hang-man game is elite and invite-only (requires a password).\nHow do you take your vegan chai?"
puts ">".blue.blink
password = gets.chomp.downcase
until password == "dirty"
  puts "#{let_me_help_you.sample.red}"
  password = gets.chomp.downcase
end
if password == "dirty"
  puts "Righteous!
  Welcome to the game! Every word is sourced locally and responsibly.
  If we had to classify it, it would be Avant-garde.
  You get 7 guesses, 7 just feels right.
  You can also type the entire word.
  This way you win the game, but the word immediately becomes too mainstream.
  Please begin:".green

  Game.new.play
end
