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
       @guesses << Guess.new(@current_card, new_guess)
       return guesses.last
     end

     def correct?
       @current_card == guesses.cards[0]
     end

end
