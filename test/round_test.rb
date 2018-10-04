require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/guess.rb'
require './lib/deck.rb'
require './lib/round.rb'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("3", "Hearts")
    @card_2 = Card.new("8", "Diamonds")
    card_3 = Card.new("2", "Clubs")
    @cards = [@card_1, @card_2, card_3]
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

  def test_return_guess_is_a_guess
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert_instance_of Guess, new_guess
  end

  def test_it_can_return_if_guess_is_correct
    new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    assert new_guess.correct?
  end

  def test_it_saves_guesses
    new_guess_1 = @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 1, @round.guesses.count
    new_guess_2 = @round.record_guess({value: "5", suit: "Diamonds"})
    assert_equal new_guess_1, @round.guesses[0]
    assert_equal new_guess_2, @round.guesses[1]
    assert_equal 2, @round.guesses.count
  end

  def test_it_records_correct_guesses_count
    @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 1, @round.number_correct
    @round.record_guess({value: "5", suit: "Diamonds"})
    assert_equal 1, @round.number_correct
    @round.record_guess({value: "2", suit: "Clubs"})
    assert_equal 2, @round.number_correct
  end

  def test_it_moves_to_next_card_after_guess
    @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal @card_2, @round.current_card
  end

  def test_it_can_calculate_percentage_correct
    @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 100, @round.percent_correct
    @round.record_guess({value: "5", suit: "Diamonds"})
    assert_equal 50, @round.percent_correct
  end
end
