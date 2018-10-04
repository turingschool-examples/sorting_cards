class Guess
  attr_reader :card, :response

  def initialize(response, card)
    @card = card
    @response = response
  end

  def correct?
    response_suit == @card.suit && response_value == @card.value
  end

  def response_suit
    @response.split[2]
  end

  def response_value
    @response.split[0]
  end

  def feedback
    correct? ? "Correct!" : "Incorrect."
  end

end
