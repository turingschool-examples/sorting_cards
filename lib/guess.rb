require 'pry'


class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    if @response.split(" of ") == [ @card.value, @card.suit ]
      true
    else
      false
    end
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
