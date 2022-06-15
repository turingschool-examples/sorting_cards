require "./lib/guess"

class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    number_of_guesses = guesses.count
    deck.cards[number_of_guesses]
  end

  def record_guess(players_guess)
    guess = "#{players_guess[:value]} of #{players_guess[:suit]}"
    card = current_card
    new_guess = Guess.new(guess, card)
    @guesses << new_guess
    new_guess
  end
end
