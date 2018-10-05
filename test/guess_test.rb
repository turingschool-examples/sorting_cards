require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card.rb'
require './lib/guess.rb'


class GuessTest < Minitest::Test
  def test_guess_exists

    card = Card.new("10", "hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_instance_of Guess, guess
  end

  def test_guess_has_response_method

    card = Card.new("10", "hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal guess.response, "10 of Hearts"
  end

  def test_guess_has_card_method

    card = Card.new("10", "hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal guess.card, card
  end

  def test_guess_value_is_integer

    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal guess.guess_value, "10"
  end

  def test_guess_suit_is_hearts

    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal guess.guess_suit, "Hearts"
  end

  def test_guess_is_correct
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert guess.correct?
  end

  def test_guess_has_correct_feedback

    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal guess.feedback, "Correct!"
  end

end
