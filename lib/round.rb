require './lib/guess'

class Round

  attr_reader :deck, :guesses, :current_card

  def initialize(deck)
    @deck  = deck
    @guesses = []
    @current_card = deck.cards.first
    @number_correct = 0
    @percent_correct = 0.0
  end

  def record_guess(guess)
    response = "#{guess[:value]} of #{guess[:suit]}"
# check if can/should add current_card to attr_reader and use getter method
# instead of referencing instance variable directly
    current_guess = Guess.new(response, @current_card)
    @current_card = deck.cards.rotate(1).first
    return current_guess
  end


end
