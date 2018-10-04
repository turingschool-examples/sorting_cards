
class Guess
  attr_reader :response,
              :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def to_string
    "#{card.value} of #{card.suit}"
  end

  def correct?
    @response == @card.to_s
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end
