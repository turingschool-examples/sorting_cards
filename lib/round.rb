require './lib/guess'
require 'pry'
class Round
  attr_reader :deck, :guesses, :number_correct
  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[0]

  end

  def record_guess(new_card)
    guess = Guess.new("#{new_card[:value]} of #{new_card[:suit]}", current_card)
    @guesses << guess
    check_guess(guess)
    @deck.cards = @deck.cards.rotate
    guess
  end

  def check_guess(guess)
    if guess.correct?
      @number_correct += 1
    end
      @number_correct
  end
  def percent_correct
    ((@number_correct.to_f / @guesses.count) * 100).round(1)
#binding.pry 
  end


end
