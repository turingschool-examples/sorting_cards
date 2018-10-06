require './lib/guess'

class Round
  attr_reader :deck, :guesses, :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
  end

  def current_card
    @deck.top_card
  end

  def record_guess(storage)
    storage_response = "#{storage[:value]} of #{storage[:suit]}"
    new_guess = Guess.new(storage_response, current_card)
    @guesses << new_guess
    @deck.top_card = @deck.cards.rotate[0]
    correct_guesses(new_guess)
    new_guess
  end

  def correct_guesses(new_guess)
    if new_guess.correct?
      @number_correct += 1
    end
  end

  def percent_correct
    (number_correct.to_f / guesses.count) * 100
  end

end
