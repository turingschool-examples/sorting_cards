require './lib/guess.rb'

class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards[card_number]
  end

  def record_guess(new_guess)
    guess = Guess.new("#{new_guess[:value]} of #{new_guess[:suit]}", current_card)
    @guesses << guess
    guess
  end

  def card_number
    @guesses.length
  end

  def number_correct
    correct = 0
    @guesses.each do |guess|
      correct += 1 if guess.correct?
    end
    correct
  end

  def percent_correct
    (number_correct.to_f / card_number.to_f * 100.0).round(1)
  end

end
