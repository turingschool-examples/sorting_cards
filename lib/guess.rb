class Guess
  attr_reader :response, :card
  def initialize(response, card) #(where card is a new instance of the Card class)
    @response = response #(in form "value of suit")
    @card = card
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
      p "Correct!"
    else
      p "Incorrect."
    end
  end
end
