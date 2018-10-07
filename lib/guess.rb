require 'pry'

class Guess
  attr_reader :card, :response
  def initialize(response, card)
    @card     = card
    @response = response
  end

  def correct?
    "#{card.value} of #{card.suit}" == response
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect!"
    end
  end

end
