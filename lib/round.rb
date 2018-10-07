require "./lib/deck"
require "./lib/guess"

class Round
  attr_reader :deck, :guesses, :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
  end

  def current_card
    guess_counter = @guesses.count
    @deck.cards[guess_counter]
  end

  def record_guess(guess_to_record)
    converted_guess = "#{guess_to_record[:value]} of #{guess_to_record[:suit]}"
    new_guess = Guess.new(converted_guess, current_card)
    @guesses << new_guess
    if new_guess.correct?
     @number_correct = number_correct + 1
     #there is shorter way to do this, find it!
    end
    new_guess
  end

  def percent_correct
    (@number_correct * 100.0)/ @guesses.count
  end
end
