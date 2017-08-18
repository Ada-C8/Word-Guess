# pull word from dictionary.txt
class Word
  attr_reader :game_word

  def initialize
    dictionary_array = []
    File.open("dictionary.txt", "r").each do |line|
      dictionary_array.push(line.chomp)
    end
    @game_word = dictionary_array.sample.split("")
  end
end
