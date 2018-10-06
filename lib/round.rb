require './lib/guess'
require 'pry'

class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards.first
  end

  def record_guess(guess)
    #keys can only be strings or symbols, but values can be whatever
    guess_response = "#{guess[:value]} of #{guess[:suit]}"
    new_guess = Guess.new(guess_response, current_card)
    @guesses << new_guess
    new_guess
  end

  def number_correct
    correct_guesses = @guesses.map do |guess|
      if guess.feedback == "Correct!"
        true
      end
    end
    p correct_guesses.compact.count
  end

  # def number_correct
  #   correct_guesses = []
  #     @guesses.each do |guess|
  #     if guess.feedback == "Correct!"
  #       correct_guesses << guess
  #     end
  #   end
  #   p correct_guesses.count
  # end

  def percent_correct
    right_guesses = @guesses.count
    p (number_correct.to_f / right_guesses) * 100
  end
end
