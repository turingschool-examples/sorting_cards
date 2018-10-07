require './lib/guess'
require './lib/card'
class Round
  attr_reader :guesses, :deck
  def initialize(deck)
    @guesses = []
    @deck = deck
  end

  def current_card
    deck.cards[@guesses.length]
  end

  def recordguess(card_hash)
    value = card_hash[:value]
    suit = card_hash[:suit]
    guess_string = Card.new(value, suit).to_s
    guess = Guess.new(guess_string, current_card)
    @guesses << guess
    guess
  end

  def number_correct
    @guesses.count do |guess|
      guess.correct?
    end
  end

  def percent_correct
    correct = number_correct
      ((correct.to_f) / (@guesses.length.to_f) * 100)
  end
end
