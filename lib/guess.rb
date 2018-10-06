class Guess
  attr_reader :response,
              :card

#include Card
#initialize(response, Card) - A guess is initialized with two arguments. The first is a response representing a response to a card in the form of <value> of <suit>. The second argument is a Card object representing the card being guessed.
  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    #This method returns a boolean indicating if the response correctly guesses the value and suit of the Card
    @response == "#{@card.value} of #{@card.suit}"
  end

    def feedback 
      #This method either returns "Correct!" or "Incorrect." based on whether the guess was correct or not
      if correct?
        "Correct!"
      else
        "Incorrect."
      end
    end

end
