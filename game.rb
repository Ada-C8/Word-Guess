class GAME
  attr_accessor :current_game_word, :current_guess, :past_letter, :total_errors

  def initialize(current_game_word, hangman_pics)
    @current_game_word = current_game_word
    @hangman_pics = hangman_pics
    #@current_hangman_pic = current_hangman_pic
    @current_guess = []
    @past_letter = [] # letters already said
    @total_errors = 0
  end

  def underscore
    @current_guess = []
    @current_game_word.length.times do
      @current_guess << "_ "
    end

    letters = ""
    @current_guess.each do |space|
      letters = space + letters + " "
    end
    return letters
  end

  def check_if_letter(str)
    # Use 'str[/[a-zA-Z]*/] == str' to let all_letters
    # yield true for the empty string
    str[/[a-zA-Z]+/]  == str
  end

  def check_if_guessed(input_letter)
    while @past_letter.include? input_letter
      puts "That letter has already been guessed"
      puts "Please guess a letter"
      input_letter = gets.chomp
    end
    return input_letter
  end

  def add_past_letters(valid_letter)
    @past_letter << valid_letter
  end

  def replace_letters(no_repeated_letter)
    @current_game_word.length.times do |i|
      if no_repeated_letter == @current_game_word[i]
        @current_guess[i] = no_repeated_letter
      end
    end
  end

  def show_letters
    nice_word = ""
    @current_guess.each do |i|
      nice_word = nice_word + i + " "
    end
    return nice_word
  end

  def count_errors(input_letter)
    unless @current_game_word.include? input_letter
      @total_errors += 1
    end
    return @total_errors
  end
  #
  def display_ascii
    return @hangman_pics[@total_errors]
  end
end
