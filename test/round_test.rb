require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("3","Hearts")
    @card_2 = Card.new("4", "Clubs")
    @deck = Deck.new([@card_1, @card_2])
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_a_deck
    assert_equal @deck, @round.deck
  end

  def test_it_starts_with_no_guess
    assert_equal [], @round.guesses
  end

  def test_it_knows_the_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_it_can_record_test
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    #expected =
    assert_instance_of Guess, new_guess
    expected = @round.guesses.last
    actual = new_guess
    assert_equal expected, actual
    #test to make sure rotating the deck
  end



end
