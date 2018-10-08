p "What's your Guess?"
response = gets.chomp
response.to_s

card = Card.new("10", "Spades")
act_card = card.act_card

test = Guess.new(response, act_card)
puts test.response
puts test.card

BACKUP

# require './card.rb'

class Guess
  attr_reader :response, :card, :correct, :feedback
  def initialize(response, card) #instance of Card class
    @card = card
    @response = response
  end

  def correct?

    if @response == @card_str
      @righto = true
    else
      @right = false
    end
  end

  def card
    @card_str = @card.act_card
    return @card

    # @card_str = @card.act_card

  end
  # def card
  #   @card = Card.new("10", "Hearts")
  # end ## maybe put this in initialize


  def response
    return @response
    # p "What's your Guess?"
    # @response = gets.chomp.to_s
  end

  def feedback
    if @righto == true
      "groovy"
    else
      "bruh"
    end
  end
  # def response
  #    p response # @ <- ?
  # end

  # def correct?
  #   if response == Card
  # end
end


def test_it_exists

def test_it_has_card

def test_it_has_response
assert_equal "10 of Hearts".guess response

def test_it_evalutes_true_false

def test_it_returns_feedback




# card = Card.new("10", "Spades")
# test = Guess.new("10 of hearts", card)
#
# puts test.response
# puts test.card
