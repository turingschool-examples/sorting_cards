require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card.rb'
require './lib/guess.rb'


class GuessTest < Minitest::Test

  def setup
    @card = Card.new("10", "Hearts")
    @guess = Guess.new("10 of Hearts", @card)
  end

  def test_guess_exists

    assert_instance_of Guess, @guess
  end

  def test_guess_has_response_method

    assert_equal "10 of Hearts", @guess.response
  end

  def test_guess_has_card_method

    assert_equal @card, @guess.card
  end

  def test_guess_value_is_integer

    assert_equal "10", @guess.guess_value
  end

  def test_guess_suit_is_hearts

    assert_equal "Hearts", @guess.guess_suit
  end

  def test_guess_is_correct

    assert @guess.correct?
  end

  def test_guess_has_correct_feedback

    assert_equal "Correct!", @guess.feedback
  end

end
