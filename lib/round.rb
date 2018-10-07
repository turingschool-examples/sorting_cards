require './lib/deck'
require './lib/guess'
require './lib/card'


class Round
    attr_reader :deck, :current_card, :current_guess,:guesses, :correct, :incorrect

     def initialize(deck)
       @deck = deck
       @guesses = []
       @current_card = deck.cards.shift
       @current_guess = current_guess
       @correct = 0
       @incorrect = 0

     end

     def record_guess(new_guess)
       current_guess = Guess.new("#{new_guess[:value]} of #{new_guess[:suit]}", @current_card)
       @guesses << current_guess
       return current_guess
     end

     if Guess.new(new_guess).correct? == true
       @correct += 1
     else
       @incorrect += 1
    end
end
