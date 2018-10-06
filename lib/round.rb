require_relative 'guess'

class Round
  attr_reader :guesses

  @@deck = []
  @@guesses = []

  def initialize(deck = nil)
    @@deck = deck if deck
  end

  #Query methods
  def deck
    @@deck
  end

  def guesses
    @@guesses
  end

  def current_card
    @@deck.cards.first
  end

  def number_correct
    @@guesses.count {|g| g.correct?}
  end

  def percent_correct
    (number_correct * 100.0 / @@guesses.size.to_f).round(1)
  end

  #Command Methods
  def record_guess(args)
    new_guess = Guess.new("#{args[:value]} of #{args[:suit]}", current_card)
    @@guesses << new_guess
    new_guess
  end

  def clear_guesses
    @@guesses = []
  end

end
