class Round
  attr_reader   :deck,
                :guesses

  def initialize(deck)
    @deck                       = deck
    @guesses                    = []
    @number_correct_incrimentor = 0
  end

  def current_card
    card_1 = @deck.cards.shift
    @deck.cards << card_1
    card_1
  end

  def record_guess(hash)
    guess_card = "#{hash[:value]} of #{hash[:suit]}"
    new_guess = Guess.new(guess_card, current_card)
    @guesses << new_guess
    @guesses.last
  end

  def number_correct
    @guesses.each do |guess|
      if guess.correct? == true
        @number_correct_incrimentor += 1
      end
    end
    @number_correct_incrimentor
  end

  def percent_correct
    (number_correct.to_f / @guesses.count.to_f) * 100
  end
end
