require_relative './lib/guess'
require_relative './lib/card'

module Card_game

  def correct?
    #This method returns a boolean indicating if the response correctly guesses the value and suit of the Card
    if guess_response == card_response
      true
    else
      false
    end
  end

  def feedback
    #This method either returns "Correct!" or "Incorrect." based on whether the guess was correct or not
    if Guess.correct? == true
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end

end
