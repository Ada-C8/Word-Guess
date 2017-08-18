require "random_word"
require "colorize"
require_relative 'Centipede'
class Game
  attr_reader :random_word, :partial_answer, :string_word, :incorrect_guess, :list_guesses
  def initialize
    @incorrect_guess = 0
    @partial_answer = []
    @list_guesses = []
    # @game_live = true
    generate_answer
    generate_partial_answer
  end

  def generate_answer
    @random_word = RandomWord.nouns(not_shorter_than: 3, not_longer_than: 7).next
    # @random_word = ["issue", "union", "refer", "bowel", "fence", "great", "valid", "urine", "glove", "money", "brick"]
    @random_word = @random_word.chars
    @string_word = @random_word.join("")
  end

  def generate_partial_answer
    length = @random_word.length
    length.times do
      @partial_answer.push("_")
    end
    return @partial_answer
  end

  def check_guess(input)
    if @random_word.include? input
      display_partial_answer(input)
      display_art
    else
      add_incorrect_guess(input)
      display_partial_answer(input)
      display_art
    end
    return "Incorrect guesses: #{@list_guesses}\n"
  end

  def win_game
    unless @partial_answer.include? "_"
      puts "WAHOO! YOU WIN!"
      exit
    end
  end

  def win_game_2
    puts "WAHOO! YOU WIN!
        \n                                   .    .
                                       )  (
              _ _ _ _ _ _ _ _ _ _ _   (.--.)
              {{ { { { { { { { { { { ( ^_^ )
              >>>>>>>>>>>>>>>>>>>>>>>>>>>--> "

              exit
  end

  def add_incorrect_guess(input)
    unless list_guesses.include?(input) || input.to_i.to_s == input
      @incorrect_guess+=1
      @list_guesses << input
      end_game
    end
  end

  def display_partial_answer(input)
    @random_word.each_with_index do |letter, index|
      if input == letter
        @partial_answer[index] = input
      end
    end
    print "\nWord: #{@partial_answer.join(" ")}\n"
    win_game
  end

  def end_game
    if @incorrect_guess==10
      puts "
                                 ^_^
                            \n
                                YOU LOSE"
      puts "                          Your word was: #{@random_word.join("")}".colorize(:red)
      exit
    end
  end

  def display_art
    if @incorrect_guess == 0
      puts  "
                              .    .
                               )  (
      _ _ _ _ _ _ _ _ _ _ _   (.--.)
      {{ { { { { { { { { { { ( ^_^ )
      >>>>>>>>>>>>>>>>>>>>>>>>>>>-->
        10 guesses left
        ".colorize(:green)
      elsif @incorrect_guess == 1
        puts "
                             .    .
                              )  (
        _ _ _ _ _ _ _ _ _    (.--.)
        { { { { { { { { { { ( ^_^ )
        >>>>>>>>>>>>>>>>>>>>>>>>-->
          9 guesses left
          ".colorize(:green)
      elsif @incorrect_guess == 2
          puts "
                             .    .
                              )  (
          _ _ _ _ _ _ _ _    (.--.)
          { { { { { { { { { ( ^_^ )
            >>>>>>>>>>>>>>>>>>>>>-->
            8 guesses left.
            ".colorize(:green)
      elsif @incorrect_guess == 3
            puts "
                             .    .
                              )  (
            _ _ _ _ _ _ _    (.--.)
            { { { { { { { { ( ^_^ )
              >>>>>>>>>>>>>>>>>>>-->
              7 guesses left.
              ".colorize(:yellow)
      elsif @incorrect_guess == 4
              puts "
                               .    .
                                )  (
                  _ _ _ _ _    (.--.)
                  { { { { { { ( ^_^ )
                  >>>>>>>>>>>>>>>>>-->
                6 guesses left.
                ".colorize(:yellow)
      elsif @incorrect_guess == 5
              puts "
                               .    .
                                )  (
                      _ _ _    (.--.)
                      { { { { ( ^_^ )
                    >>>>>>>>>>>>>>>-->
                5 guesses left.
                ".colorize(:yellow)
      elsif @incorrect_guess == 6
              puts "
                               .    .
                                )  (
                        _ _    (.--.)
                        { { { ( ^_^ )
                        >>>>>>>>>>>-->
                4 guesses left.
                ".colorize(:yellow)
      elsif @incorrect_guess == 7
              puts "
                               .    .
                                )  (
                           _    (.--.)
                             { ( ^_^ )
                            >>>>>>>>-->
                3 guesses left.
                ".colorize(:red)
      elsif @incorrect_guess == 8
              puts "


                                 (.--.)
                                ( ^_^ )
                                >>>>-->
                2 guesses left.
                ".colorize(:red)
      elsif @incorrect_guess == 9
              puts "



                                ( ^_^ )

                 1 guess left!
                ".colorize(:red)
      else  puts "UH OH!"
    end
  end

# actual game play
game1 = Game.new
puts "Welcome to Word Guess!"

 loop do
   puts "Please choose a letter"
   input = gets.chomp.downcase
   if input == game1.string_word
     game1.win_game_2
   elsif input.length == 1 && /[[:lower:]]/.match(input)
     puts game1.check_guess(input)
   else
     puts game1.check_guess(input)

     puts "Please enter ONE LETTER unless you have the full word:"
   end
 end
end
