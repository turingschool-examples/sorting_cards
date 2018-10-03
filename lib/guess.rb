class Guess
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def response
    @guess
  end

  def correct?
    if @guess.split[0] == card.value && @guess.split[-1] == card.suit
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
