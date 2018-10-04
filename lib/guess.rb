class Guess
  attr_reader :card, :guess

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    arr = response.split
    card.value == arr[0] && card.suit == arr[-1]
  end

  def feedback
    correct? ? "Correct!" : "Incorrect."
  end

  def response
    @guess
  end

end
