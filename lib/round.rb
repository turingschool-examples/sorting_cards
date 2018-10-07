require './lib/guess'
require './lib/card'

class Round
  attr_reader :guesses, :deck, :current_card
  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card = deck.cards.shift
    @first_card = @current_card
  end

  def next_card
    @current_card = deck.cards.shift
  end

  def record_guess(card_hash)
    guessString = Card.new(card_hash[:value], card_hash[:suit]).to_s
    guess = Guess.new(guessString, current_card)
    @guesses << guess
    next_card
    guess
  end

  def number_correct
    @guesses.count(&:correct?)
  end

  def percent_correct
    correct = number_correct
    (correct.to_f / @guesses.count.to_f) * 100
  end
end
