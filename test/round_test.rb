require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'

class RoundTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Round, round
  end

  def test_it_has_arguments
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal deck, round.deck
  end

  def test_that_guesses_is_initialized_with_empty_array
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [], round.guesses
  end

  def test_that_current_card_returns_first_item_of_array
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
  end

  def test_that_it_records_first_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    assert_instance_of Guess, new_guess
    assert_equal true, new_guess.correct?
    assert_equal [new_guess], round.guesses
    assert_equal 1, round.number_correct
    assert_equal card_2, round.current_card
  end

  def test_that_it_records_another_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 2, round.guesses.count
    assert_equal "Incorrect.", round.guesses.last.feedback
    assert_equal 1, round.number_correct
  end

  def test_that_percent_correct_returns_percentage
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("2", "Spades")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 100.0, round.percent_correct
    round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 50.0, round.percent_correct
    round.record_guess({value: "2", suit: "Spades"})
    assert_equal 66.7, round.percent_correct
  end



end
