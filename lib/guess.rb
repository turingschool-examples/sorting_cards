class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @response = response
    @card = card
    @approved_values = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "ace", "king", "queen", "jack", "spades", "hearts", "diamonds", "clubs"]
  end

  def correct?  
    response_list = @response.split(" ").select do | word |
      sanitized_word = word.gsub!(/[^0-9A-Za-z]/, '') || word
      
      @approved_values.include?(sanitized_word.downcase)
    end
  
    response_list[0] == @card.value &&
    response_list[1] == @card.suit
  end

  def feedback
    if self.correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end
