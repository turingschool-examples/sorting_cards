class Guess
  attr_reader :card
  def initialize(guess, card)
    @guess = guess
    @card = card
    @correct = guess == card.to_s
  end

  def correct?
    @correct
  end

  def response
    @guess
  end

  def feedback
    if @correct
      'Correct!'
    else
      'Incorrect!'
    end
  end
end
