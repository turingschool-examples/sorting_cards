require './lib/deck'
require './lib/guess'
# require './lib/card'


class Round
    attr_reader :deck, :current_card
    attr_accessor :guesses

     def initialize(deck)
       @deck = deck
       @guesses = [] #needs to be set equal to the class guess
                    # at a later point
       @current_card = deck.cards.shift#this needs to equal card_1
     end

     def record_guess(new_guess)
       # require 'pry'; binding.pry

       @guesses << Guess.new(@current_card, new_guess) 

     end

     def correct?
       @current_card = guesses.cards[0]

     end

end
