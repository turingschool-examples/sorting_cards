
class Guess
  attr_reader :answer,
              :card

  def initialize(answer, card)
    @answer = answer
    @card = card
  end

  def response
     answer
  end

  def card
    @card
  end

  def to_string
    "#{card.value} of #{card.suit}"
  end

  def correct?
    answer == to_s
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end
