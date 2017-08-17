def include_letter?(input)
  ind_array = []
  ind = 0
  @word.count(input).times do
    ind = @word.index(input)
    ind_array << ind
    new_str = @word[ind..-1]
    puts new_str
  end
  return ind
end


@word = "hello"
puts include_letter?("l")


#
#
# if @word.count("input") == 1
#   ind << @word.index
# elsif @word.count("input") > 1
#   ind << @word.index
