class Round
attr_reader :deck, :guesses
  def initialize(deck)
    @deck = deck
    @guesses = []

  end

  def current_card
    deck.cards[0]
  end

  def record_guess(user_guess)
    response = "#{user_guess[:value]} of #{user_guess[:suit]}"
    card = current_card
    new_guess = Guess.new(response, card)
    @guesses << new_guess
    return new_guess
  end


end
