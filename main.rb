#word guess game
# require_relative "dictionary.txt"

# pull words from dictionary.txt
dictionary_array = []
File.open("dictionary.txt", "r").each do |line|
  dictionary_array.push(line.chomp)
end

game_word = dictionary_array.sample.split("")
