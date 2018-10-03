require './lib/card'
require 'pry'

class Guess
  attr_reader :guess, :card
#The card in init is not the same card that is entered from the other app
#This is also an instance of this program taking and manipulating a variable from another app.
  def initialize(guess, card)
    @guess = guess
    @card = card
    @suit = card.suit
    @value = card.value
  end

  def response
    guess
  end

  def correct?
    if guess = "#{card.value} of #{card.suit}"
      guess == true
    else
      guess == false
    end
    #if statement to check is the cards are the same
  end

end

card = Card.new("10", "Hearts")
guess = Guess.new("10 of Hearts", card)

binding.pry
