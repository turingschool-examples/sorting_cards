require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'

class GuessTest < Minitest::Test
  def test_it_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_instance_of Guess, guess
  end

  def test_it_has_card
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal card, guess.card
  end

  def test_it_has_response
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    response = guess
    assert_equal "10 of Hearts", guess.response
  end

  def test_it_evalutes_true_or_false
    card = Card.new("10", "Hearts")
    guess_1 = Guess.new("10 of Hearts", card)
    guess_2 = Guess.new("9 of Hearts", card)
    assert_equal true, guess_1.correct?
    assert_equal false, guess_2.correct?
  end


  def test_it_returns_feedback
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "Correct!", guess.feedback
  end
end
