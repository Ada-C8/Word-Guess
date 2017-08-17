class AsciiArt
  attr_reader :body, :candle_light, :candle_body
  attr_writer :candle_light, :candle_body
  def initialize
    @body = [
"    |||||
  @@@@@@@@@
  {~@~@~@~}
@@@@@@@@@@@@@
{~@ HAPPY @~}
{  BIRTHDAY }
@@@@@@@@@@@@@"
]
    # @candle_light = ["    `````"] #don't move
    # @candle_body = ["    |||||"] #don't move
    @candle_light = "    `````" #don't move


  end

  def change_candles
    a = @candle_light.split('')
    a.pop
    @candle_light = a.join
  end

  def take_away_candle
    change_candles
    puts @candle_light
    puts @body
  end
end
