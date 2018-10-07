require './lib/round'
require './lib/guess'
require './lib/card'
require './lib/deck'
require 'pry'


class Round

attr_reader :deck, :guesses, :number_correct
  def initialize(deck)
    @deck = deck
    @guesses = []   #put as an instance variable because not doing an action
    @number_correct = 0
    @number_of_guesses = 0

  end

    def current_card
      @deck.cards[@number_of_guesses]
    end

    def record_guess(guess_card)
      new_guess = Guess.new("#{guess_card[:value]} of #{guess_card[:suit]}", current_card)
      @guesses << new_guess
      if new_guess.correct?
        @number_correct += 1
      end
      @number_of_guesses += 1
      new_guess #want to just return the new_guess, dont want double []
    end

    def percent_correct
      (@number_correct.to_f / @number_of_guesses.to_f) * 100


    end






end







  #@deck.cards
