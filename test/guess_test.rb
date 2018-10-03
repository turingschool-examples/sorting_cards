require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'

class Guess < Minitest::Test
  def test_it_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal guess.card, card
  end

#def test_it_has_a_value
##card = Card.new("10", "hearts")
##assert_equal "10", card.value
#end

#def test_it_has_a_suit
##card = Card.new("10", "hearts")
##assert_equal "hearts", card.suit
#end
end
