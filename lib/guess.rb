require 'pry'

class Guess
  attr_reader :response,
              :card

  def initialize( response, card )
    @response = response
    @card = card
  end

  def guess_value
    x = @response.split(" ")
    x.first
  end

  def guess_suit
    x = @response.split(" ")
    x.last
  end

  def correct?
    (self.guess_value == card.value && self.guess_suit == card.suit)
  end

  def feedback
    if self.correct? == true
      return "Correct!"
    else
      return "Incorrect."
    end
  end

end
