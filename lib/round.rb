class Round
  attr_reader :deck, :guesses, :record_guess

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.top_card
  end

  def record_guess(storage)
    storage_response = "#{storage[:value]} of #{storage[:suit]}"
    new_guess = Guess.new(storage_response, current_card)
    @guesses << new_guess
    @deck.top_card = @deck.cards.rotate[0]
    new_guess
  end

  def number_correct
    @guesses.count
  end

end
