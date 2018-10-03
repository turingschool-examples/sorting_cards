class Round

attr_reader :deck, :guesses, :number_correct

  def initialize(deck)
    @deck    = deck
    @guesses = []
    @number_correct_index = 0
  end

  def current_card
    @deck.cards.first
  end

  def record_guess(card_hash)
    guess = "#{card_hash[:value]} of #{card_hash[:suit]}"
    @guesses << new_guess = Guess.new(guess, current_card)
    new_guess
  end

  def number_correct
    @guesses.each do |guess|
      if guess.feedback == "Correct!"
        @number_correct_index += 1
        else
      end
    end
    @number_correct_index
  end

end
