require './lib/guess'

class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[0]
  end

  def record_guess(new_hash)
    value = new_hash[:value]
    suit = new_hash[:suit]
    response = "#{value} of #{suit}"
    guess = Guess.new(response, current_card)
    @guesses << guess
    guess
  end

  def number_correct
    @guesses.each do |x|
      if   x.correct? #== true
      @number_correct += 1
      else
      end
      @number_correct

    end
  end


end
