require './lib/guess'

class Round

  attr_reader :deck,
              :guesses,
              :number_correct

  def initialize(deck)
    @deck  = deck
    @guesses = []
    @deck_tracker = 0
    @number_correct = 0
  end

  def current_card
    if @deck_tracker == deck.cards.size
      @deck_tracker = 0
    end
    @deck.cards[@deck_tracker]
  end

  def record_guess(guess)
    response = "#{guess[:value]} of #{guess[:suit]}"
    current_guess = Guess.new(response, current_card)

    @deck_tracker += 1
    @guesses << current_guess

    if current_guess.correct?
      @number_correct += 1
    end

    return current_guess
  end

  def percent_correct
    @number_correct.to_f / @guesses.size.to_f * 100.0
  end

end
