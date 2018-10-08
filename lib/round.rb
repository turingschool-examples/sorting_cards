require 'pry'

class Round

  attr_reader :deck, :guesses

  def initialize(deck)
    @deck    = deck
    @guesses = []
  end

  def current_card
    card_1 = @deck.cards.shift
    @deck.cards << card_1
    card_1
  end

  def record_guess(card_hash)
    guess = "#{card_hash[:value]} of #{card_hash[:suit]}"
    @guesses << Guess.new(guess, current_card)
    @guesses.last
  end

  def number_correct
    number_correct_index = 0
    @guesses.each do |guess|
      if guess.feedback == "Correct!"
        number_correct_index += 1
        else
      end
    end
    number_correct_index
  end

  def percent_correct
   (number_correct.to_f/@guesses.count)*100
  end

end




















# def make_a_guess(guess_info)
#   new_guess = create_guess(guess_info)
#   log_guess(new_guess)
#   new_guess
# end
#
# def create_guess(guess_info)
#   formatted_guess = "#{guess_info[:value]} of #{guess_info[:suit]}"
#   Guess.new(formatted_guess, current_card)
# end
#
# def log_guess(new_guess)
#   @guesses << new_guess
# end
