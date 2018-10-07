require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'

class GuessTest < Minitest::Test
  def setup
    @card = Card.new('Ace', 'Spades')
    @guess = Guess.new('2 of Diamonds', @card)
    @guess2 = Guess.new('Ace of Spades', @card)
  end

  def test_if_card_guess_equal
    # skip
    assert_equal @card, @guess.card
  end

  def test_if_correct_works
    assert_equal false, @guess.correct?
    assert_equal true, @guess2.correct?
  end

  def test_response
    assert_equal '2 of Diamonds', @guess.response
    assert_equal 'Ace of Spades', @guess2.response
  end

  def test_feedback
    assert_equal 'Incorrect.', @guess.feedback
    assert_equal 'Correct!', @guess2.feedback
  end
end
