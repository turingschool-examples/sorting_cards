require_relative 'card'
class Guess
  attr_reader :card, :guess, :guessed_card

  def initialize(string, card)
    @guess = string
    @card = card
    arr = response.split
    @guessed_card = Card.new(arr[0], arr[-1])
  end

  def correct?
     card.value == guessed_card.value && card.suit == guessed_card.suit
  end

  def feedback
    correct? ? "Correct!" : "Incorrect."
  end

  def response
    @guess
  end

end
