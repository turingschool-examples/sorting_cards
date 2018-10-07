require './lib/deck'
require './lib/guess'
require './lib/card'
require './lib/deck'


class Round
    attr_reader :deck, :current_card, :guesses, :current_guess, :number_correct, :number_incorrect
     def initialize(deck)
       @deck = deck
       @guesses = []
       @current_card = deck.cards.shift
       @number_correct = 0
       @number_incorrect = 0


     end

     def record_guess(new_guess)
       current_guess = Guess.new("#{new_guess[:value]} of #{new_guess[:suit]}", @current_card)
       @guesses << current_guess


       if current_guess.correct?

         @number_correct += number_correct+ 1
       else
         @number_incorrect += 1
       end

       return current_guess

     end


end
