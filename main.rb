#word guess game
# require_relative "dictionary.txt"

# pull words from dictionary.txt
dictionary_array = ["test"]
File.open("dictionary.txt", "r").each do |line|
  dictionary_array.push(line.chomp)
end

print dictionary_array
