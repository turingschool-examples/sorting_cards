class Guess
  attr_reader :response,
              :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    if @response.split[0] == card.value && @response.split[-1] == card.suit
      true
    else
      false
    end
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end

end
