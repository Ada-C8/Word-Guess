# Word guess game - Kayla and Laura

class WordGuess
  attr_reader :game

  def initialize
    @game = game
  end

  def word_bank
    word_list = ["Accio", "Patronus", "Wand", "Hermione", "Snitch", "Dobby"]
    our_word = word_list.sample
    puts our_word
    puts our_word.chars.each_slice(1).to_a
  end

end

game = WordGuess.new
game.word_bank
