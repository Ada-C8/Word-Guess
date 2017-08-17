class AsciiArt
  attr_reader :body, :candle_light, :candle_body
  def initialize
    @body = [
"  @@@@@@@@@
  {~@~@~@~}
@@@@@@@@@@@@@
{~@ HAPPY @~}
{  BIRTHDAY }
@@@@@@@@@@@@@"
]
    @candle_light = ["    `````"]
    @candle_body = ["    |||||"] #don't move


  end

  def change_candles

  end
end

test1 = AsciiArt.new

puts test1.candle_light
puts test1.candle_body
puts test1.body
