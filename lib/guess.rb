

class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @response = response #string of form "value of suit"
    @card = card #card object
  end

  def correct?
    @response.split.first == @card.value && @response.split.last == @card.suit
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end
