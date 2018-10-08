require './lib/guess'
require './lib/deck'

class Round
  attr_reader :deck, :guesses, :number_correct
  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[0]
  end

def record_guess(hash)
new_guess = Guess.new(hash[:value] + " of " + hash[:suit], current_card)
@deck.new_card
@guesses << new_guess
if new_guess.correct? == true
  @number_correct += 1
end
new_guess
end

def percent_correct
  (number_correct.to_f / guesses.length) * 100
end

end
