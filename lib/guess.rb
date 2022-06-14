# pry(main)> require './lib/guess'
# #=> true
#
# pry(main)> require './lib/card'
# #=> true
#
# pry(main)> card = Card.new("10", "Hearts")
# #=> #<Card:0x00007f9984004cc0 @suit="Hearts", @value="10">
#
# pry(main)> guess = Guess.new("10 of Hearts", card)
# #=> #<Guess:0x00007f99842f0998 @card=#<Card:0x00007f9984004cc0 @suit="Hearts", @value="10">, @guess="10 of Hearts">
#
# pry(main)> guess.card
# #=> #<Card:0x00007f9984004cc0 @suit="Hearts", @value="10">
#
# pry(main)> guess.response
# #=> "10 of Hearts"
#
# pry(main)> guess.correct?
# #=> true
#
# pry(main)> guess.feedback
# #=> "Correct!"

class Guess
  attr_reader :response, :card, :guess

  def initialize(response, card)
    @card = card
    @response = response
    # @value = value
    # @suit = suit
    # @guess = guess
  end

  def correct?
   @response == @card.value + " of " + @card.suit
   # elsif guess.response != card
   #   then "false"
  end

  def feedback
    if correct?
     then "Correct!"
    else "Incorrect"
    end
  end
end
