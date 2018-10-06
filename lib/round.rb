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
    # new_card = @deck.cards.rotate(1)
    # @deck << new_card
  end

  def record_guess(new_hash)
    value = new_hash[:value]
    suit = new_hash[:suit]
    response = "#{value} of #{suit}"
    guess = Guess.new(response, current_card)
    @guesses << guess
    check_guess(guess)
    guess
    binding.pry
  end

  def check_guess(guess)
    if guess.correct?
      @number_correct += 1
    end
      @number_correct
  end
  # def percent_correct
  #   ((@number_correct.to_f / guesses.count) * 100).round(1)
  #
  # end


end
