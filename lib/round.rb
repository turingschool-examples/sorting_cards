class Round
  
  attr_reader :deck,
              :guesses

  attr_accessor :deck

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards.first
  end

  def record_guess(value:, suit:)
    record = Guess.new("#{value} of #{suit}", self.current_card)
    @guesses << record 
    if record.correct?
      @deck.cards.rotate!
    end
    record
  end

  def number_correct
    @guesses.select {|guess|guess.correct?}.count
  end

  def percent_correct
    (number_correct.to_f / @guesses.count.to_f)* 100
  end
end
