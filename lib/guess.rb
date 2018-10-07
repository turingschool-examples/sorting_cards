require './lib/card'
class Guess
  attr_reader :response, :card
  def initialize (response, card)
    @response = response
    @card = card

  end

  def correct?
    [@card.value, @card.suit] == @response.split(' of ')
  end


  def feedback
    if correct? == true
      p "True!"
    else
      p "False!"
    end
  end

  def number_correct
    return @correct
  end

  def number_incorrect
    return @incorrect
  end

end
