
require "./lib/card"
class Guess
  attr_reader :response, :card
  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    guess_value = @response.split(" of ").first
    guess_suit = @response.split(" of ").last
    guess_value == @card.value && guess_suit == @card.suit
  end
  def card_no_space
    card.value + card.suit
  end
  def feedback
    if correct? == true
       "Correct!"
    else
      "Incorrect!"
    end
    #either returns "Correct" or "Incorrect"
  end

end

 card = Card.new("10", "Hearts")
 guess = Guess.new("10 of Hearts", card)
 guess_1 = Guess.new("2 of Diamonds", card)
 puts guess.correct?
