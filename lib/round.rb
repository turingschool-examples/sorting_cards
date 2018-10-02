class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_i = 0
  end

  def current_card
    @deck.cards[@current_i]
  end

  def record_guess(args)
    new_guess = Guess.new("#{args[value]} of #{args[suit]}", current_card)
    @guesses << new_guess
    @current_i.increment_loop(3)
    new_guess
  end

  def number_correct
    @guesses.count {|g| g.correct?}
  end

  def percent_correct
    number_correct * 100.0 / @guesses.size
  end

end

class Integer

  def increment_loop(max, amount = 1, min = 0)
    if self < max
      self.public_send("+", amount)
    else
      self.public_send("-", self)
    end
  end

end
