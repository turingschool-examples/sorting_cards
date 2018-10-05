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
  end

  def test_guess_is_correct
    new_guess = Guess.new("3 of Hearts",card)
    card_1 = Card.new("3 of Hearts",card)
    card_2 = Card.new("4 of Clubs",card)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal true, new_guess.correct?
  end
end
