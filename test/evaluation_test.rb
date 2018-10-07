require_relative 'test_helper'
require_relative '../lib/evaluation'

class EvaluationTest < MiniTest::Test

  def test_it_evals_suits_as_same_color
    assert Evaluation.same_color?("Diamonds", "Hearts")
    assert Evaluation.same_color?("Clubs", "Spades")
  end

  def test_it_evals_suits_as_NOT_same_color
    refute Evaluation.same_color?("Diamonds", "Spades")
    refute Evaluation.same_color?("Clubs", "Hearts")
  end

  def test_it_evaluates_card_suit_when_same
    card = Card.new("2","Spades")
    response = "3 of Spades"
    guess = Guess.new(response, card)
    assert_equal :same, Evaluation.evaluate_suit(guess)
  end

  def test_it_evaluates_card_suit_same_color
    card = Card.new("2","Clubs")
    response = "5 of Spades"
    guess = Guess.new(response, card)
    assert_equal :same_color, Evaluation.evaluate_suit(guess)
  end

  def test_it_evaluates_card_suit_when_different
    card = Card.new("2","Hearts")
    response = "3 of Spades"
    guess = Guess.new(response, card)
    assert_equal :diff_color, Evaluation.evaluate_suit(guess)
  end

  #Now value eval tests
  def test_it_evaluates_card_value_when_same
    card = Card.new("10","Hearts")
    response = "10 of Clubs"
    guess = Guess.new(response, card)
    assert_equal :same, Evaluation.evaluate_value(guess)
  end

  def test_it_evaluates_card_value_when_high
    card = Card.new("10","Hearts")
    response = "Jack of Clubs"
    guess = Guess.new(response, card)
    assert_equal :high, Evaluation.evaluate_value(guess)
  end

  def test_it_evaluates_card_value_when_low
    card = Card.new("10","Hearts")
    response = "9 of Clubs"
    guess = Guess.new(response, card)
    assert_equal :low, Evaluation.evaluate_value(guess)
  end
end
