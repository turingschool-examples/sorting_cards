class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    value = @response.split.first
    suit = @response.split.last

    return value == @card.value && suit == @card.suit
  end

  def feedback
    if correct?
      return "Correct!"
    end

    "Incorrect."
  end

end
