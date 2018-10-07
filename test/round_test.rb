require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/round'
require './lib/deck'
require './lib/guess'
require 'pry'

class RoundTest < Minitest::Test
  def setup
    @card1 = Card.new('3', 'Hearts')
    @card2 = Card.new('Ace', 'Clubs')
    @deck = Deck.new([@card1, @card2])
    @round = Round.new(@deck)
  end

  def test_init
    assert_instance_of Round, @round
  end

  def test_deck
    assert_equal @deck, @round.deck
  end

  def test_record_guess
    @guess1 = @round.record_guess(value: '3', suit: 'Hearts')
    assert_instance_of Guess, @guess1
    assert_equal 1, @round.guesses.count
    assert_equal 1, @round.number_correct
    assert @guess1.correct?
    assert_equal 'Correct!', @round.guesses.last.feedback
    @guess2 = @round.record_guess(value: 'Jack', suit: 'Diamonds')
    assert_instance_of Guess, @guess2
    refute @guess2.correct?
    assert_equal [@guess1, @guess2], @round.guesses
    assert_equal 2, @round.guesses.count
    assert_equal 1, @round.number_correct
    assert_equal 'Incorrect.', @round.guesses.last.feedback
    assert_equal 50.0, @round.percent_correct
  end
end
