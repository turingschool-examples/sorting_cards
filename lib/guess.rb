class Guess
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def response
    @guess
  end

  def correct?
    #.split separated the @guess values into an array, and we assigned that array to the variable guess_keywords
   guess_keywords = @guess.split (' ')
   card_suit = @card.suit
   card_value = @card.value
   guess_keywords[2] == card_suit && guess_keywords[0] == card_value
  end

  def feedback
    #this is an instance of the Guess class, so you can call instance methods here
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end

end
