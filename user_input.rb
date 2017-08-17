class UserInput
  attr_reader :current_letter
  def initialize
    @current_letter = gets.chomp.downcase
    @wrong_letters = []
    @right_letters = []
  end

  def check_letter(class_rw)
    if class_rw.word.include?(@current_letter)
      @right_letters << @current_letter
      print @right_letters
      return
    else
      @wrong_letters << @current_letter
      print @wrong_letters
      return
    end

  end
end
