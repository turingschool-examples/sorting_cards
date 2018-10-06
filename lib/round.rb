class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card_index = 0
  end

  def current_card
    @deck.cards[@current_card_index]
  end

  def record_guess(guess_hash) #guess arguement is a hash
    # Create a string of form "value of suit" from guess hash
    response_string = guess_hash[:value] + " of " + guess_hash[:suit]
    # Create new guess object and push to guesses array
    new_guess = Guess.new(response_string, current_card)
    @guesses << new_guess
    @current_card_index += 1
    return new_guess
  end

  def number_correct
    correct_guesses = 0 #initialize
    @guesses.each do |guess|
      correct_guesses += 1 if guess.correct?
    end
    return correct_guesses
  end

  def percent_correct
    (number_correct.to_f * 100.00 / @guesses.count).round(1)
  end
end
