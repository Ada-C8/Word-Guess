class Game
  attr_reader :random_word, :partial_answer
  def initialize
    generate_answer
    @incorrect_guess = 0
    @partial_answer = ["_", "_", "_", "_", "_"]
    @game_live = true
    @list_guesses = []
  end

  def generate_answer
    @random_word = ["issue", "union", "refer", "bowel", "fence", "great", "valid", "urine", "glove", "money", "brick"]
    @random_word = @random_word.sample.chars
  end

  def partial_answer
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
      print "Incorrect guesses: #{@list_guesses}\n"
  end

  def win_game
    unless @partial_answer.include? "_"
      puts "WAHOO! YOU WIN!"
      exit
    end
  end

  def add_incorrect_guess(input)
    @incorrect_guess+=1
    @list_guesses << input
    end_game
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
                                ( ^_^ )
                            \n
                                YOU LOSE"
      puts "                          Your word was: #{@random_word.join("")}"
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
        WOW! You guessed correctly!
        "
      elsif @incorrect_guess == 1
        puts "
                             .    .
                              )  (
        _ _ _ _ _ _ _ _ _    (.--.)
        { { { { { { { { { { ( ^_^ )
        >>>>>>>>>>>>>>>>>>>>>>>>-->
          9 guesses left
          "
      elsif @incorrect_guess == 2
          puts "
                             .    .
                              )  (
          _ _ _ _ _ _ _ _    (.--.)
          { { { { { { { { { ( ^_^ )
            >>>>>>>>>>>>>>>>>>>>>-->
            8 guesses left.
            "
      elsif @incorrect_guess == 3
            puts "
                             .    .
                              )  (
            _ _ _ _ _ _ _    (.--.)
            { { { { { { { { ( ^_^ )
              >>>>>>>>>>>>>>>>>>>-->
              7 guesses left.
              "
      elsif @incorrect_guess == 4
              puts "
                               .    .
                                )  (
                  _ _ _ _ _    (.--.)
                  { { { { { { ( ^_^ )
                  >>>>>>>>>>>>>>>>>-->
                6 guesses left.
                "
      elsif @incorrect_guess == 5
              puts "
                               .    .
                                )  (
                      _ _ _    (.--.)
                      { { { { ( ^_^ )
                    >>>>>>>>>>>>>>>-->
                5 guesses left.
                "
      elsif @incorrect_guess == 6
              puts "
                               .    .
                                )  (
                        _ _    (.--.)
                        { { { ( ^_^ )
                        >>>>>>>>>>>-->
                4 guesses left.
                "
      elsif @incorrect_guess == 7
              puts "
                               .    .
                                )  (
                           _    (.--.)
                             { ( ^_^ )
                            >>>>>>>>-->
                3 guesses left.
                "
      elsif @incorrect_guess == 8
              puts "


                                 (.--.)
                                ( ^_^ )
                                >>>>-->
                2 guesses left.
                "
      elsif @incorrect_guess == 9
              puts "



                                ( ^_^ )

                 1 guess left!
                "
      else  puts "UH OH!"
        end
      end

          # end # end class

          # actual game play
          game1 = Game.new
          puts "Welcome to Word Guess!"

          game_live = true
          while game_live
          # print game1.generate_answer
          # print game1.partial_answer

          puts "Please choose a letter"
          input = gets.chomp
          puts game1.check_guess(input)

        end
      end
          # puts game1.display_partial_answer


          #
          # puts game1.generate_answer
          # game_live = true
          # guess = ""
          #
          # # guess.include? @random_word
          #
          # while game_live
          #   puts "Guess a letter"
          #   guess = gets.chomp
          #
          #   # game2 = Game.new
          #   # puts game2.generate_answer
          #
          # end
        # end
