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

  def feedback 
    "Correct!"
  end

end



