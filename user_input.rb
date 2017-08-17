class UserInput
  def initialize
    @current_letter = gets.chomp.upcase
    @wrong_letters = []
    @right_letters = []
  end

  def check_letter(class_rw)
    if class_rw.word.include?(@current_letter)

      # puts ":)"
      return
    else
      # puts ":("
      # puts class_rw.word
      return
    end

  end
end
