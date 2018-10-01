

class Guess
  attr_reader :card, :guess, :suit, :value

  def initialize(string, card)
    @guess = string
    arr = response.split
    @value = arr[0]
    @suit = arr[-1]
    @card = card
  end

  def correct?
    return true if card.value == @value && card.suit == @suit
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
