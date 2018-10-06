require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require 'pry'

class GuessTest < Minitest::Test
  def setup
    @card = Card.new("10", "Hearts")
    @guess = Guess.new("10 of Hearts", @card)
  end

  def test_it_exists
    assert_instance_of Guess, @guess
  end

  def test_it_has_a_response
    assert_equal "10 of Hearts", @guess.response
  end

  def test_it_has_a_card
    assert_equal @card, @guess.card
  end
end
