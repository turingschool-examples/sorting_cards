require './lib/guess'

class Round

  attr_reader :deck,
              :guesses,
              :current_card,
              :number_correct,
              :percent_correct

  def initialize(deck)
    @deck  = deck
    @guesses = []
    @deck_tracker = 0
    @current_card = deck.cards[@deck_tracker]
    @number_correct = 0
    @percent_correct = 0.0
  end

  def record_guess(guess)
    response = "#{guess[:value]} of #{guess[:suit]}"
# check if it's better to use getter methods or access instance
# variables directly???
    current_guess = Guess.new(response, @current_card)

# Separate this into a separate method?
    @deck_tracker += 1
    @current_card = deck.cards[@deck_tracker]

    @guesses << current_guess

# Separate this into a different method?
    if current_guess.correct?
      @number_correct += 1
    end
    @percent_correct = @number_correct.to_f / @guesses.size.to_f * 100.0

    return current_guess
  end


end
