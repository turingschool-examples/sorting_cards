require 'pry'


class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @guess = response
    @card = card
  end

  def response
    # binding.pry
    @guess
  end

  def correct?
    binding.pry
    if @guess.split(" of ") == @card
      true
    else
      false
    end
  end

end
