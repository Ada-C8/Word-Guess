class Game
  attr_reader :random_word, :partial_answer
  def initialize
    generate_answer
    # @guess = guess
    @incorrect_guess = 0
    @partial_answer = ["_", "_", "_", "_", "_"]
    @game = true
    # @input = input
  end

  def generate_answer
    @random_word = ["issue", "union", "refer", "bowel", "fence", "great", "valid", "urine", "glove", "money", "brick"]
    @random_word = @random_word.sample.chars

  end
  def partial_answer
    return @partial_answer
  end

  def check_guess(input)
    display_partial_answer(input)
    display_art
    if @random_word.include? input
    else
      add_incorrect_guess
    end
  end


  def add_incorrect_guess
    @incorrect_guess+=1
    end_game
  end

  def add_correct_guess
  end

  def display_partial_answer(input)
    @random_word.each_with_index do |letter, index|
      if input == letter
        puts index
        @partial_answer[index] = input

        print @partial_answer
      end
    end
  end

  def end_game
    if @incorrect_guess==10
      game_live = false
      # break
    end
  end

  def display_art
    case @incorrect_guess
    when 0
      return  "
      .    .
      )  (
      _ _ _ _ _ _ _ _ _ _ _   (.--.)
      {{ { { { { { { { { { { ( ^_^ )
        >>>>>>>>>>>>>>>>>>>>>>>>>>-->
        WOW! You guessed correctly!
        "
      when 1
        return "
        .    .
        )  (
        _ _ _ _ _ _ _ _ _   (.--.)
        { { { { { { { { { { ( ^_^ )
          >>>>>>>>>>>>>>>>>>>>>>>-->
          9 guesses left
          "
        when 2
          return "
          .    .
          )  (
          _ _ _ _ _ _ _ _   (.--.)
          { { { { { { { { { ( ^_^ )
            >>>>>>>>>>>>>>>>>>>>>-->
            8 guesses left.
            "
          when 3
            return "
            .    .
            )  (
            _ _ _ _ _ _ _   (.--.)
            { { { { { { { { ( ^_^ )
              >>>>>>>>>>>>>>>>>>>-->
              7 guesses left.
              "
            when 4
              return ""
            when 5
              return ""
            when 6
              return ""
            when 7
              return ""
            when 8
              return ""
            when 9
              return ""
            else
              return ""
            end
          end

          # end # end class

          # actual game play

          game1 = Game.new
          puts "Welcome to Word Guess!"

          print game1.generate_answer
          print game1.partial_answer
          puts "Please choose a letter"
          input = gets.chomp
          puts game1.check_guess(input)
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
        end
