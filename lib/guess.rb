require './lib/card'
require 'pry'

class Guess
  attr_reader :response, :card
  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    @response == card.value + " of " + card.suit
  end

  def feedback
    if correct? == true
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end

end
