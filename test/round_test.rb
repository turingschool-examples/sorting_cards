require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/guess'
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

  def test_it_records_guess
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal Guess, new_guess.class
    assert_equal new_guess, @round.guesses[0]
  end

  #def test_it_evaluates_correct_guesses




end #DeckTest Class
