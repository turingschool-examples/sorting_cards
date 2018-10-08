require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/deck'
require './lib/card'

class RoundTest < Minitest::Test
  def test_it_exists

    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Round, round
  end

  def test_it_starts_with_a_deck
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Deck, round.deck
    assert_equal deck, round.deck
  end

  def test_it_records_a_guess
    guess_1 = Guess.new("3","Hearts")
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Guess, round.record_guess({value: "3", suit: "Hearts"})
    assert_equal "3 of Hearts", round.guesses.last.response
    assert_instance_of Array, round.guesses
  end

  def test_guess_is_correct
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    assert_equal true, new_guess.correct?
  end

  def test_number_correct
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    new_guess_2 = round.record_guess({value: "Ace", suit: "Spades"})
    new_guess_3 = round.record_guess({value: "3", suit: "Clubs"})
    assert_equal = 1, round.number_correct
  end

  def test_percent_correct
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    new_guess_2 = round.record_guess({value: "Ace", suit: "Spades"})
    round_1 = round.record_guess({value: "Jack", suit: "Diamonds"})
    round_1 = round.record_guess({value: "4", suit: "Hearts"})
    assert_equal 4, round.guesses.count
    assert_equal "Incorrect.", round.guesses.last.feedback
    assert_equal 1, round.number_correct
    assert_equal 25.0, round.percent_correct
  end

end
