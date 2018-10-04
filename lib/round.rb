require './lib/deck'
require './lib/guess'
require 'pry'

class Round
  attr_reader :deck,
              :guesses,
              :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[0]
  end

  def record_guess(guess)
    response = "#{guess[:value]} of #{guess[:suit]}"
    @guesses << Guess.new(response, current_card)
    @number_correct += 1 if @guesses.last.correct?
    @deck.cards.shift
    return @guesses.last
  end

  def percent_correct
    ((@number_correct.to_f / @guesses.count) * 100).round(1)
  end


end
