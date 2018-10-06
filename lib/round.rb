require './lib/guess'
class Round
  attr_reader :guesses, :deck, :current_card
  def initialize(deck)
    @current_card = deck.cards[0]
    @guesses = ({value: "3", suit: "Hearts"})
    @deck = deck
  end

  def recordguess
    @guesses
  end
end
