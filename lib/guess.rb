class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    response_list = @response.split(" ")
  
    response_list[0] == card.value &&
    response_list[2] == card.suit
  end

  def feedback
    if self.correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end
