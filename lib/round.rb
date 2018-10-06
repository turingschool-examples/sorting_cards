require 'pry'
class Round
attr_reader :deck,
            :guesses,
            :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
  end

  def current_card
    @deck.cards.first
  end

  def record_guess(hash)
    current_guess = Guess.new((hash[:value] + " of " + hash[:suit]), current_card)
    @guesses << current_guess
    if current_guess.correct? == true
      @number_correct += 1
    end
    return current_guess
  end

end
