class Guess
  attr_reader :card, :response

  def initialize(response, card)
    @card = card
    @response = response
  end

  def correct?
    response_suit = @response.split[2]
    response_value = @response.split[0]
    response_suit == @card.suit && response_value == @card.value
  end

  def feedback
    self.correct? ? "Correct!" : "Incorrect."
  end

end
