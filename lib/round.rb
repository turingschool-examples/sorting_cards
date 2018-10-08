class Round
attr_reader :deck, :guesses
  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards[0]
  end

  def next_card
    @deck.cards.shift
  end

  def record_guess(user_guess)
    response = "#{user_guess[:value]} of #{user_guess[:suit]}"
    new_guess = Guess.new(response, current_card)
    @guesses << new_guess
    next_card
    new_guess
  end

  def number_correct
    @guesses.count do |guess|
      guess.correct?
      end
  end


end
