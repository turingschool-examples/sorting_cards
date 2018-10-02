require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'


class GuessTest < Minitest::Test
  def setup
    @card = Card.new("Queen", "Hearts")
    @guess = Guess.new("Queen of Hearts", @card)
  end

  def test_it_exists
    skip
    assert_instance_of Guess, @guess
  end

  def test_it_has_a_instantiated_card
    skip
    assert_equal card, @guess.card
  end
  
  def test_it_has_a_response
    skip
    assert_equal "Queen of Hearts", @guess.response
  end
end