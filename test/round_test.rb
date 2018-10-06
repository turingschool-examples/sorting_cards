require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("3", "Hearts")
    @card_2 = Card.new("4", "Clubs")
    @deck = Deck.new([@card_1, @card_2])
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_holds_a_deck
    assert_equal @deck, @round.deck
  end

  def test_it_holds_initialized_guesses
    assert_equal [], @round.guesses
  end

  def test_it_returns_current_card
    assert_equal @card_1, @round.current_card
  end

end #DeckTest Class
