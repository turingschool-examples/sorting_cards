class Guess
  attr_reader :card, :response

  def initialize(response, card)
    @card = card
    @response = response
  end

  def build_card_response
    "#{@card.value} of #{@card.suit}"
  end

  def correct?
    #.split separated the @guess values into an array, and we assigned that array to the variable guess_keywords
   build_card_response == @response
  end

  def feedback
    # if correct? == true
    #   "Correct!"
    # else
    #   "Incorrect."
    correct? ? "Correct!" : "Incorrect."
    # end
  end

end
