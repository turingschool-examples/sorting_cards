class Guess
  attr_reader :guess, :card
#The card in init is not the same card that is entered from the other app
#This is also an instance of this program taking and manipulating a variable from another app.
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def response
    guess
  end

  def correct?
    matching = ["#{card.value}", "of", "#{card.suit}"]
    if guess.split == matching
      true
    else
      false
    end
  end

  def feedback
    if correct? == true
      p "Correct!"
    else
      p "Incorrect!"
    end
  end
end
