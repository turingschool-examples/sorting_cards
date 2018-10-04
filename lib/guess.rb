require 'pry'

class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?  
    formated_response = format_response(@response)
    
    formated_response[0] == @card.value &&
    formated_response[1] == @card.suit
  end
  
  def format_response(response)
    response_list = response.split(" of ")
    response_keyword_one = response_list[0].split(" ").last
    response_keyword_two = response_list[1].split(" ").first
    sanitized_keyword_one = response_keyword_one.gsub(/[^0-9A-Za-z]/, '').downcase
    sanitized_keyword_two = response_keyword_two.gsub(/[^0-9A-Za-z]/, '').downcase
    [sanitized_keyword_one, sanitized_keyword_two]
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end
