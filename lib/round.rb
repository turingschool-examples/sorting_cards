require './lib/guess'
require 'pry'

class Round
  attr_reader :deck, :guesses, :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
  end

  def record_guess(guess)
    if @deck.count == 0
      return "The deck is empty!"
    end

    converted_guess = "#{guess[:value]} of #{guess[:suit]}"

    new_guess = Guess.new(converted_guess, @deck.cards.shift)

    @guesses.push(new_guess)

    self.check_guess(new_guess)

    new_guess
  end

  def check_guess(new_guess)
    if new_guess.correct?
      @number_correct += 1
    end
  end

  def percent_correct
    @number_correct.to_f / @guesses.count.to_f * 100
  end
end
