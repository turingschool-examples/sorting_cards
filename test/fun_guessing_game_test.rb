require_relative '../lib/fun_guessing_game'
require_relative 'test_helper'

class FunGuessingGameTest < MiniTest::Test

  #helper_methods
  def help_setup_small_deck1
    card1 = Card.new("Ace","Hearts")
    card2 = Card.new("Ace","Spades")
    card3 = Card.new("3","Clubs")
    @small_deck1 = Deck.new(card1, card2, card3)
  end


  #testing evaluation methods
  #Starting with suit eval tests
  def test_it_evals_suits_as_same_color
    assert FunGuessingGame.same_color?("Diamonds", "Hearts")
    assert FunGuessingGame.same_color?("Clubs", "Spades")
  end

  def test_it_evals_suits_as_NOT_same_color
    refute FunGuessingGame.same_color?("Diamonds", "Spades")
    refute FunGuessingGame.same_color?("Clubs", "Hearts")
  end

  def test_it_evaluates_card_suit_when_same
    card = Card.new("2","Spades")
    response = "3 of Spades"
    guess = Guess.new(response, card)
    assert_equal :same, FunGuessingGame.evaluate_suit(guess)
  end

  def test_it_evaluates_card_suit_same_color
    card = Card.new("2","Clubs")
    response = "5 of Spades"
    guess = Guess.new(response, card)
    assert_equal :same_color, FunGuessingGame.evaluate_suit(guess)
  end

  def test_it_evaluates_card_suit_when_different
    card = Card.new("2","Hearts")
    response = "3 of Spades"
    guess = Guess.new(response, card)
    assert_equal :diff, FunGuessingGame.evaluate_suit(guess)
  end

  #Now value eval tests
  def test_it_evaluates_card_value_when_same
    card = Card.new("10","Hearts")
    response = "10 of Clubs"
    guess = Guess.new(response, card)
    assert_equal :same, FunGuessingGame.evaluate_value(guess)
  end

  def test_it_evaluates_card_value_when_high
    card = Card.new("10","Hearts")
    response = "Jack of Clubs"
    guess = Guess.new(response, card)
    assert_equal :high, FunGuessingGame.evaluate_value(guess)
  end

  def test_it_evaluates_card_value_when_low
    card = Card.new("10","Hearts")
    response = "9 of Clubs"
    guess = Guess.new(response, card)
    assert_equal :low, FunGuessingGame.evaluate_value(guess)
  end


end
