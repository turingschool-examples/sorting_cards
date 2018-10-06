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
   # return true if build_card_response == @response
   # return false if build_card_response != @response
   # or try shorthand with the ternary operator:
   build_card_response == @response ? true : false
  end

  def feedback
    # if correct? == true
    #   "Correct!"
    # else
    #   "Incorrect."
    correct? == true ? "Correct!" : "Incorrect."
    # end
  end

end
