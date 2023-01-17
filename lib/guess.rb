class Guess
  attr_reader :card,
              :response

  def initialize(response, card)
    @response = response
    @card = card 
    @correct = true
  end

  def correct?
    @correct
  end

  def check_if_correct 
    if response == "#{card.value} of #{card.suit}" 
      @correct = true
    else
      @correct = false
    end
  end
  
  def feedback 
    if response == "#{card.value} of #{card.suit}" 
      "Correct!"
    else
      "Incorrect."
    end
  end
end



