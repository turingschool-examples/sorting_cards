require './lib/deck'
require './lib/guess'

class Round
  attr_reader :deck,
              :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards[0]
  end

  def record_guess(guess)
    response = "#{guess[:value]} of #{guess[:suit]}"
    @guesses << Guess.new(response, current_card)
    @deck.cards.shift
    return @guesses.last
  end


end
