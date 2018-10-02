class Guess
  attr_reader :guess, :suit, :value, :card
  def initialize(string, card)
    @guess = string.downcase
    @card = card
    @suit = card.suit.downcase
    @value = card.value.downcase
  end

  def response
    guess
  end

  def correct?
    value_guess, suit_guess = guess.split(' of ')
    value_guess == value && suit_guess == suit
  end

  def feedback
    correct? ? "Correct!" : "Incorrect."
  end
end
