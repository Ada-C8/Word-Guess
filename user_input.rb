class UserInput
  attr_reader :current_letter
  def initialize
    @current_letter = gets.chomp.downcase
    @wrong_letters = []
    @right_letters = []
  end

  def check_letter(class_rw, user_input)
    if class_rw.word.include?(@current_letter)
      @right_letters << @current_letter
      class_rw.rewrite_underscore(user_input)
      print @right_letters
      return
    else
      @wrong_letters << @current_letter
      print @wrong_letters
      return
    end
  end

  def get_next_letter
    @current_letter = gets.chomp.downcase
  end
end
