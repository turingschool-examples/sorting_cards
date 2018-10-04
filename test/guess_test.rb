require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'

class GuessTest < Minitest::Test

  def setup
    @card = Card.new("10", "Hearts")
  end

  def test_it_exists
    guess = Guess.new("10 of Hearts", @card)
    assert_instance_of Guess, guess
  end

  def test_it_has_a_response
    guess = Guess.new("10 of Hearts", @card)
    assert_equal "10 of Hearts", guess.response
  end

  def test_it_has_a_card
    guess = Guess.new("10 of Hearts", @card)
    assert_equal @card, guess.card
  end

  def test_it_has_correct
    guess = Guess.new("10 of Hearts", @card)
    assert guess.correct?
  end

  def test_it_gives_feedback
    guess = Guess.new("10 of Hearts", @card)
    assert_equal "Correct!" guess.feedback
  end
end
