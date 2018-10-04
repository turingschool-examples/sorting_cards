require_relative 'guess'

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
    new_guess = Guess.new("#{args[:value]} of #{args[:suit]}", current_card)
    @guesses << new_guess
    @current_i = @current_i.increment_loop(@deck.cards.size - 1)
    new_guess
  end

  def number_correct
    @guesses.count {|g| g.correct?}
  end

  def percent_correct
    pc = (number_correct * 100.0 / @guesses.size.to_f).round(1)
    require 'pry'; binding.pry if pc = 40.0
    pc
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
