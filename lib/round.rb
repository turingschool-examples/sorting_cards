require_relative 'guess'

class Round
  attr_reader :num_guesses

  @@deck = []
  @@guesses = []

  def initialize(deck = nil)
    @num_guesses = 0
     if deck
       @@deck = deck
     else
       @@deck.cards.rotate!
     end
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
    response = args.is_a?(Hash) ? "#{args[:value]} of #{args[:suit]}" : args

    new_guess = Guess.new(response, current_card)
    @@guesses << new_guess; @num_guesses += 1
    new_guess
  end

  def clear_guesses
    @@guesses = []
  end

  def reset
    @@deck.shuffle!
  end

end
