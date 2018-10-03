require './lib/guess.rb'

class Round
  attr_reader :deck, :guesses, :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @card_number = 0
    @number_correct = 0
  end

  def current_card
    @deck.cards[@card_number]
  end

  def record_guess(new_guess)
    card = self.current_card
    guess = Guess.new("#{new_guess[:value]} of #{new_guess[:suit]}", card)

    @guesses.push(guess)

    if guess.correct? then @number_correct += 1 end

    @card_number += 1
    guess
  end

  def percent_correct
    @number_correct.to_f / @guesses.count.to_f * 100.0
  end

end
