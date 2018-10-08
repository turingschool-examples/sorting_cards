require './lib/guess'

class Round
  attr_reader :deck,
              :next_card

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards[0]
  end

  def next_card
    @deck.cards = @deck.cards.rotate(1)
  end

  def guesses
    @guesses
  end

  def record_guess(hash)
    value = hash[:value]
    suit = hash[:suit]
    response = "#{value} of #{suit}"
    @guesses << Guess.new(response, current_card)
    self.next_card
    @guesses.last
  end

  def number_correct
     counter = 0
    @guesses.each do |guess| #each value(guess) in the array
      if guess.correct?
        counter += 1
      end
    end
    return counter
  end

  def percent_correct
    percentage = (self.number_correct / @guesses.count.to_f) * 100
    percentage.round(1)
  end



end
