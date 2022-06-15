class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    ####response = "10 of Hearts"
    guess_value = response.split[0]
    guess_suit = response.split[2]

    if guess_value == @card.value && guess_suit == @card.suit
      true
    else
      false
    end
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect!"
    end
  end
end
