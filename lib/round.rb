require './lib/deck'
require './lib/guess'
require './lib/card'
require './lib/deck'


class Round
    attr_reader :deck, :current_card, :guesses, :current_guess, :correct, :incorrect, :number_correct, :number_incorrect
     def initialize(deck)
       @deck = deck
       @guesses = []
       @current_card = deck.cards.shift
       @current_guess = current_guess
       @correct = 0
       @incorrect = 0
       @number_correct = number_correct
       @number_incorrect = number_incorrect


     end

     def record_guess(new_guess)
       current_guess = Guess.new("#{new_guess[:value]} of #{new_guess[:suit]}", @current_card)
       @guesses << current_guess


       if @guesses.last.correct? == true
         @correct += 1
       else
         @incorect += 1
       end

       return current_guess

     end


end
