require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("Ace", "Clubs")
    @card_2 = Card.new("8", "Spades")
    @card_3 = Card.new("Queen", "Hearts")
    @deck = Deck.new(@card_1, @card_2, @card_3)
    @round = Round.new(@deck)
    @correct_guess = Guess.new("8 of Spades", @card_1)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_a_deck
    assert_equal @deck, @round.deck
  end

  def test_it_has_current_card_and_is_first_in_deck
    assert_equal @deck.cards.first, @round.current_card
  end

  def test_it_has_guesses_and_is_empty
    assert_empty @round.guesses
  end

  def test_it_records_a_guess
    assert_same(@correct_guess,
    @round.record_guess({value: 8, suit: "Spades"}))
  end
end
