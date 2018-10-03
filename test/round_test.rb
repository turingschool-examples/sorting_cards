require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/guess.rb'
require './lib/deck.rb'
require './lib/round.rb'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("Ace", "Spades")
    card_2 = Card.new("8", "Diamonds")
    card_3 = Card.new("2", "Clubs")
    @cards = [@card_1, card_2, card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_returns_deck
    assert_equal @deck, @round.deck
  end

  def test_it_creates_guesses_when_initialized
    assert_empty @round.guesses
  end

  def test_it_returns_1st_card_after_initialize
    assert_equal @card_1, @round.current_card
  end

end
