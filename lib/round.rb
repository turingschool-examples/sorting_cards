class Round
  attr_reader :deck, :guesses
  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    gueeses.at(0)
  end
  def record_guess
    #study Hashes
  end



end
