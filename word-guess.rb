require 'random-word'

RandomWord.exclude_list.push(/_/, /\'/, /-/)

#word class for unique words
class Word
  attr_reader :word, :letters, :num, :lives, :guesses, :guess

  def initialize
    if [1, 2, 3].sample == 3
      @word = RandomWord.adjs(not_shorter_than: 4).next
    else
      #tried to add not_shorter_than functionality, but didn't work
      @word = RandomWord.nouns.next
    end
    @letters = @word.split("")
    @num = @letters.length
    @guesses = []
    @lives = 7
  end

  def display
    num_correct = 0
    @letters.each do |letter|
      if @guesses.include?(letter)
        print letter + " "
        num_correct += 1
      else
        print "_ "
      end
    end
    print "\n"
    if num_correct == @num
      puts "You guessed the word! WOOO!"
      exit
    end
    num_correct = 0
  end

  def prompt
    art
    if @lives == 0
      puts "You have zero lives left! You lost!"
      puts "The word was #{@word}."
      exit
    else
      puts "Please guess a letter! You have #{@lives} lives left!"
      if @guesses.length > 0
        print "You have already guessed the following letters: "
        @guesses.each do |bad_letter|
          print bad_letter
          print ", " if bad_letter != @guesses.last
          print "\n" if bad_letter == @guesses.last
        end
      end
    end
  end

  def guessing
    prompt
    @guess = gets.chomp.to_s.downcase

    #accepts the whole word and allows the user to win
    if @guess == @word
      puts "You guessed the word! You win!"
      exit
    elsif @guess.length == @word.length
      puts "You guessed incorrectly! The word was #{@word}! YOU LOSE"
      exit
    end

    # check if the guess is a valid guess
    valid = 0
    until valid == 1
      if is_letter?(@guess) && !already_guessed?(@guess)
        valid = 1
        @guesses.push(@guess)
      else
        if already_guessed?(@guess)
          puts "You already chose that letter! Please choose another."
        else
          puts "Please enter a single letter."
        end
        @guess = gets.chomp.to_s.downcase
      end
    end
    # check if the guess is in the word
    @lives -= 1 if @letters.include?(@guess) == false
    return @letters.include?(@guess)
  end

  private

  def is_letter?(guess)
    return ('a'..'z').to_a.include?(@guess)
  end

  def already_guessed?(guess)
    return @guesses.include?(guess)
  end

  def art
    case @lives
      when 0
        puts <<~ZERO

           0000
          00  00
          00  00
          00  00
           0000

        ZERO
      when 1
        puts <<~ONE

          1111
            11
            11
            11
          111111

        ONE
      when 2
        puts <<~TWO

           2222
          22  22
             22
            22
          222222

        TWO
      when 3
        puts <<~THREE

           3333
          33  33
             333
          33  33
           3333

        THREE
      when 4
        puts <<~FOUR

          44  44
          44  44
          444444
              44
              44

        FOUR
      when 5
        puts <<~FIVE

          555555
          55
          55555
              55
          55555

        FIVE
      when 6
        puts <<~SIX

           6666
          66
          66666
          66  66
           6666

        SIX
      when 7
        puts <<~SEVEN

          777777
             77
            77
           77
          77

        SEVEN
      else
    end
  end


end #end Word class

def game
  gameword = Word.new
  until gameword.guess == "exit"
    gameword.display
    gameword.guessing
  end
end

game
