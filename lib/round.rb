require './lib/guess'
require './lib/card'

class Round
  attr_accessor :current_card, :guesses, :current_index
  attr_reader :deck
  def initialize(deck)
    @deck = deck
    @current_index = 0
    @current_card = @deck.cards[@current_index]
    @guesses = []
  end

  def record_guess(guess_hash)
    guess = create_guess(guess_hash)
    @guesses.push(guess)
    update_current_card
    guess
  end

  def create_guess(guess_hash)
    value, suit = guess_hash.values
    guess = Guess.new("#{value} of #{suit}", current_card)
  end

  def update_current_card
    @current_index += 1
    @current_index = 0 if current_index >= deck.cards.length
    @current_card = deck.cards[current_index]
  end
end
