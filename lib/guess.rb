class Guess
  attr_reader :card,
              :guess
  
  def initialize(guess, card)
    @card = card
    @guess = guess
  end
  
  def response
    @guess
  end
 
  def correct?
    "#{@card.value} of #{card.suit}" == @guess  
  end

  def feedback
    if self.correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end
end
