class Round

  attr_reader :deck, :guesses, :number_correct

  def initialize(deck)
    @deck    = deck
    @guesses = []
    @number_correct_index = 0
  end

  def current_card
    card_1 = @deck.cards.shift
    @deck.cards << card_1
    card_1
  end

  def record_guess(card_hash)
    guess = "#{card_hash[:value]} of #{card_hash[:suit]}"
    @guesses << Guess.new(guess, current_card)
    @guesses.last
  end

  def number_correct
    @guesses.each do |guess|
      if guess.feedback == "Correct!"
        @number_correct_index += 1
        else
      end
    end
    @number_correct_index
  end

  def percent_correct
   (number_correct.to_f/@guesses.count)*100
  end

end
