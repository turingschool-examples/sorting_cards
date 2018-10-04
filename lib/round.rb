class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  e
  def current_card
    @deck.cards[0]
  end




end
