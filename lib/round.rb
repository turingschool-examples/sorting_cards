require './lib/guess'
require './lib/card'

class Round
  attr_accessor :current_card, :guesses
  attr_reader :deck
  def initialize(deck)
    @deck = deck
    @current_card = @deck.cards.first
    @guesses = []
  end

  def record_guess(guess_hash)
    value, suit = guess_hash.values
    guess = create_guess("#{value} of #{suit}", current_card)
  end

  def create_guess(guess_string, card)
    guess = Guess.new(guess_string, card)
  end
end
