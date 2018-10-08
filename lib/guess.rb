class Guess
  attr_reader       :response,
                    :card

  def initialize(guess, card)
    @response   = guess
    @card       = card
  end

  def correct?
    if @response == "#{@card.value} of #{@card.suit}"
      true
    else
      false
    end
  end

  def feedback
    if correct? == true
      return "Correct!"
    else
      return "Incorrect."
    end
  end

end
