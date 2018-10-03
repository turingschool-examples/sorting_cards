class Guess
  attr_reader :card, :guess, :suit, :value

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    arr = response.split
    return true if card.value == arr[0] && card.suit == arr[-1]
    return false
  end

  def feedback
    return "Correct!"if correct?
    "Incorrect."
  end

  def response
    @guess
  end

end
