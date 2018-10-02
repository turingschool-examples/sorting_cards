class Round

attr_reader :deck, :guesses

  def initialize(deck)
    @deck    = deck
    @guesses = []
  end

  def current_card
    @deck.cards.first
  end

  def record_guess(card_hash)
    guess = "#{card_hash[:value]} of #{card_hash[:suit]}"
    new_guess = Guess.new(guess, current_card)
    @guesses << new_guess
    new_guess
  end
  #
  # def number_correct
  #   @guesses
  # end
  #binding.pry
end
