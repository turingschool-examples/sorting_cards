require 'pry'


class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    @response.split(" of ") == [ @card.value, @card.suit ]
  end

  def feedback
    # binding.pry
    if correct?
      "You win!"
    else
      "You're wrong."
    end
  end

end
