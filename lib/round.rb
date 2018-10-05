require "./lib/deck"
require "./lib/guess"
require "pry"
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
    converted_guess = "#{guess_to_record[:value]} of #{guess_to_record[:suit]}"
     Guess.new(converted_guess, current_card)

  end
end
