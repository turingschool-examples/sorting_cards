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

  def test_its_card_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal card, guess.card
  end

  def test_response_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "10 of Hearts", guess.response
  end

  def test_it_evaluated_correctness
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    refute_equal "10 of Hearts", guess.correct?

  end

  def test_it_returns_feedback
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "Correct!", guess.feedback

  end






end
