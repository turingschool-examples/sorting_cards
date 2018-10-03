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
    if @guess.split(" of ") == [ @card.value, @card.suit ]
      true
    else
      false
    end
  end

  def feedback
    # binding.pry
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end

end
