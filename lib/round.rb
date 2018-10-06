require './lib/deck'
require './lib/guess'
require './lib/card'


class Round
    attr_reader :deck, :current_card
    attr_accessor :guesses

     def initialize(deck)
       @deck = deck
       @guesses = []
       @current_card = deck.cards.shift
     end

     def record_guess(new_guess)
       current_guess = Guess.new(@current_card, new_guess)
       @guesses << current_guess
       return current_guess
     end

     def correct?
       @current_card == guesses.cards[0]
     end

end
