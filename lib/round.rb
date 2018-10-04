require './lib/guess'

class Round

  attr_reader :deck,
              :guesses,
              :number_correct,
              :percent_correct

  def initialize(deck)
    @deck  = deck
    @guesses = []
    @deck_tracker = 0
    @number_correct = 0
    @percent_correct = 0.0
  end

  def current_card
    if @deck_tracker == deck.cards.size
      @deck_tracker = 0
  end

  def record_guess(guess)
    # Create method for this!
    if current_card == nil

    response = "#{guess[:value]} of #{guess[:suit]}"
# check if it's better to use getter methods or access instance
# variables directly???
    current_guess = Guess.new(response, current_card)

# Separate this into a separate method?
# How to deal with the end of the deck?
# ...Check if deck_tracker is longer than deck length
    @deck_tracker += 1

    @guesses << current_guess

# Separate this into a different method?
    if current_guess.correct?
      @number_correct += 1
    end
    @percent_correct = @number_correct.to_f / @guesses.size.to_f * 100.0

    return current_guess
  end


end
