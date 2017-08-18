class UserInput
  attr_reader :current_letter, :wrong_letters
  def initialize
    @current_letter = ""
    @wrong_letters = []
    @right_letters = []
  end

  def check_letter(class_rw, user_input, cake)
    @current_letter = gets.chomp.downcase
    # if random word array includes @current_letter
    if class_rw.word.include?(@current_letter)
      @right_letters << @current_letter
      puts "Good job, keep guessin'"
      # replace underscore at that index with user_input(@current_letter)
      class_rw.rewrite_underscore(user_input)
      # print @right_letters
      return
    else
      @wrong_letters << @current_letter
      puts "WRONG, you loss a candle. Try Again".red

      cake.take_away_candle
      # print @wrong_letters
      return
    end
  end

  def get_next_letter
    @current_letter = gets.chomp.downcase
  end
end
