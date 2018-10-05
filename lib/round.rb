require_relative 'guess'

class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards.first
  end

  def record_guess(args)
    new_guess = Guess.new("#{args[:value]} of #{args[:suit]}", current_card)
    @guesses << new_guess
    @deck.cards.rotate!
    new_guess
  end

  def number_correct
    @guesses.count {|g| g.correct?}
  end

  def percent_correct
    (number_correct * 100.0 / @guesses.size.to_f).round(1)
  end

end
