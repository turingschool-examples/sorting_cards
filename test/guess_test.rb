require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'

class GuessTest < Minitest::Test

  def test_it_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_instance_of Guess, guess
  end

  # test .card returns input value
  def test_it_has_a_card
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal card, guess.card
  end
  # test .response is "10 of Hearts"
  def test_it_has_a_response
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "10 of Hearts", guess.response
  end

  def test_guess_correct
    card = Card.new("10", "hearts")
    guess = Guess.new("10 of hearts", card)
    assert_equal true, guess.correct?
  # compare card with guess
  # interpolate card value & suit
  end

  def test_guess_results_in_feedback
    card = Card.new("10", "hearts")
    guess = Guess.new("10 of hearts", card)
    refute_nil guess.feedback
  # test .feedback
  end
end
