
class Guess
  attr_reader :answer, :card
  def initialize(answer, card)
    @answer = answer
    @card = card
  end

  def response
     answer
  end

  def card
    @card
  end

  def correct?
    answer == @card
  end

  def feedback
    if answer == @card
      puts "Correct!"
    else
      puts "Incorrect."
    end

  end
end
