require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/deck'
require './lib/card'
require './lib/guess'


class RoundTest < Minitest::Test
  def test_does_it_exist
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_is_there_a_deck
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_are_guesses_empty
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_does_current_card_exist
  card_1 = Card.new("3","Hearts")
  card_2 = Card.new("4", "Clubs")
  deck = Deck.new([card_1, card_2])
  round = Round.new(deck)

  assert_equal card_1, round.current_card
  end

  def test_does_record_guess_work
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})

    assert_instance_of Guess, new_guess
    assert_equal card_1, new_guess.card
    assert_equal "3 of Hearts", new_guess.response
    assert new_guess.correct?
  end

  def test_does_record_guess_store_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})

    assert_equal [new_guess], round.guesses
  end
end
