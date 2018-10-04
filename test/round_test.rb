require './lib/round'
require './lib/guess'
require './lib/card'
require './lib/deck'
require 'Minitest/autorun'
require 'minitest/pride'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("3", "Hearts")
    @card_2 = Card.new("4", "Clubs")
    @deck = Deck.new([@card_1, @card_2])
    @round = Round.new(@deck)
  end

  def test_it_exists
    round = Round.new(@deck)

    assert_instance_of Round, round
  end

  def test_if_it_round_contains_deck
    assert_equal @deck, @round.deck
  end

  def test_if_guesses_returns__empty_array
    assert_equal [], @round.guesses
  end



end
