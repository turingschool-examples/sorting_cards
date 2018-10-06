require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'

class GuessTest < Minitest::Test
  def setup
    @card = Card.new("10", "Hearts")
    @guess = Guess.new("10 of Hearts", @card)
  end

  def test_it_exists
    skip
  end

  def test_it_has_a_response
    skip
  end

  def test_it_is_correct
    skip
  end

  def test_it_has_feedback
    skip
  end

end
