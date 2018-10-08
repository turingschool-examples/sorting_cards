class Round
  attr_reader :deck, :guesses, :full_guess
    def initialize(deck)
    @deck = deck
    @guesses = []
    @full_guess = full_guess
    end

  def current_card
    deck.cards.delete_at(0)
  end
  def record_guess(recorded)
    inguess = "#{recorded[:value]} of #{recorded[:suit]}"
    Guess.new(inguess, current_card)
  end




end
