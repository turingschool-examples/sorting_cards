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

  def record_guess(hash)
    new_guess = Guess.new("#{hash[value]} of #{hash[suit]}", )
    @guesses << new_guess
    @current_i.increment_loop(3)
    new_guess
  end


  def number_correct
    @guesses.count {|g| g.correct?}
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
