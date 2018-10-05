require "./lib/deck"
require "./lib/guess"
class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
   @deck.cards.first
  end

  def record_guess(guess_to_record)
     Guess.new(guess_to_record, current_card)

  end
end
