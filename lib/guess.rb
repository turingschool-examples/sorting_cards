require 'pry'
require './lib/round.rb'

class Guess
  attr_reader :response,
              :card

  def initialize( response, card )
    @response = response
    @card = card
  end

  def guess_value
    response_values = @response.split(" ")
    response_values.first
  end

  def guess_suit
    response_values = @response.split(" ")
    response_values.last
  end

  def correct?
    guess_value == card.value && guess_suit == card.suit
  end

  def feedback
    if correct? == true
      return "Correct!"
    else
      return "Incorrect."
    end
  end

end
