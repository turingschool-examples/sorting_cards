class Round
  attr_reader :deck, :guesses, :record_guess

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards[0]
  end

  def record_guess(storage)
    storage_response = "#{storage[:value]} of #{storage[:suit]}"
    new_guess = Guess.new(storage_response, current_card)
    @guesses << new_guess
    new_guess
  end

  def number_correct
    @guesses.count
  end

end
