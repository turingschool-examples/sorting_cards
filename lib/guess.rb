class Guess
attr_reader :card, :response

  def initialize(string, card)
      @card = card
      @response = string
  end


  def correct?
    @response == "#{@card.value} of #{@card.suit}"
  end

  def feedback
    if correct? == true
       "Correct!"
    else
       "Incorrect."
    end
  end
end
