class Round
attr_reader :card, :deck, :guesses, :current_card

  def initialize(card)
    @card = card
    @deck = deck
    @guesses = guesses
    @current_card = current_card
  end

  def deck

  end

  def guesses
    guesses = []
    # @guesses << @guess
  end

  def current_card
    current_card = card
  end

  def record_guess
  end
end
