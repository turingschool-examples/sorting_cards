# require './lib/round'
# require './lib/guess'
# require './lib/card'
# require './lib/deck'
# require 'pry'

class Guess

#A guess is initialized with two arguments.
#The first is a string representing a response to a card in the form of <value> of <suit>.
#The second argument is a Card object representing the card being guessed.
attr_reader :response, :card

  def initialize(response, card)

    #<value> of <suit>
    @response = response
    @card = card

  end

  def correct?
    @response == card.value + " of " + card.suit
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

end



#This method returns the Card
  #def card
  #  p Card
  #end

#This method returns a boolean indicating if the response correctly guesses the value and suit of the Card
  #def correct?
  #  if guess == true

  #  els


  #end





#This method either returns "Correct!" or "Incorrect." based on whether the guess was correct or not
#  def feedback
# if guess == true
# p "Correct!"
#else guess == false
#p "Incorrect"

#  end
















#card = Card.new("Ace", "Spades")
#guess = Guess.new("10 of Hearts", card)
#guess.string
#guess.card
#guess.Card
