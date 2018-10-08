require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/guess'
require './lib/card'
require './lib/deck'
require 'pry'

class RoundTest <Minitest::Test
  def test_it_exists
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Round, round
  end

  def test_it_has_a_deck
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Deck, round.deck

  end

  def test_it_has_guesses_as_an_empty_array
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [], round.guesses
  end

  def test_it_has_a_current_card
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
  end

  def test_it_records_a_guess
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    assert_instance_of Guess, new_guess
    assert_instance_of Card, new_guess.card
    assert_equal card_1, new_guess.card
    assert_equal "3 of Hearts", new_guess.response
    assert new_guess.correct?
  end

  def test_record_guess_has_guesses_in_the_round
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    assert_equal [new_guess], round.guesses
  end

  def test_it_can_count_the_number_of_correct_guesses
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal 0, round.number_correct
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 1, round.number_correct

  end

  def test_current_card_updates
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    assert_equal card_2, round.current_card

  end

  def test_percent_correct
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 1, round.number_correct
    assert_equal 2, round.guesses.count
    assert_equal "Incorrect", round.guesses.last.feedback
    assert_equal 50.0, round.percent_correct
  end









end
