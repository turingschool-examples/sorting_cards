class Round
  attr_reader :current_card, :guesses, :deck

  def initialize(deck)
    @deck = deck
    @guesses = []

  end

  # def guesses
  # @guesses
  # end

  def current_card
    card_counter = @guesses.count #
    @deck.cards[card_counter]
  end

  def record_guess(hash)
    guess_card = "#{hash[:value]} of #{hash[:suit]}"
    guess = Guess.new(guess_card, current_card)
    @guesses << guess
    # @deck.rotate(1)

    # @counter + 1
    guess
  end

  # def correct?
  #   if record_guess == current_card
  #     #@correct =+ 1
  #     true
  #   else
  #     false
  #   end
  # end

  def number_correct
    correct_counter = 0
    @guesses.each do |guess|
      if guess.correct? # == true
        correct_counter += 1
      end
    end

    # if correct? == true
    #   correct =+ 1
    # end
    correct_counter
  end

  def percent_correct
    percent = (number_correct.to_f / @guesses.count) * 100
    "#{percent} % correct"

  end




  #def record
end
