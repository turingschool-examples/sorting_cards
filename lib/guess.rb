class Guess
  attr_reader :card, :response

  def initialize(response, card)
    @card = card
    @response = response
  end

  def correct?
    @response.split[2] == @card.suit && @response.split[0] == @card.value
  end

  def feedback
    self.correct? ? "Correct!" : "Incorrect."
  end

end
