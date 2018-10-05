require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/card'
require './lib/deck'
class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("3","Hearts")
    @card_2 = Card.new("4", "Clubs")
    @card_3 = Card.new("5", "Diamonds")
    @test_cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@test_cards)
  end

  def test_it_exists
    subject = Round.new(@deck)
    assert_instance_of Round, subject
  end

  def test_it_has_deck
    subject = Round.new(@deck)
    assert_equal @deck, subject.deck
  end

  def test_current_card_is_first_on_deck
    subject = Round.new(@deck)
    assert_equal @card_1, subject.current_card
  end

  def test_a_guess_can_be_recorded
    subject = Round.new(@deck)
    assert_equal subject.guesses, []
    new_guess = subject.record_guess({value: "3", suit: "Hearts"})
    assert_instance_of Guess, new_guess
    assert_equal true, new_guess.correct?
    skip
    assert_equal [new_guess], subject.guesses
    assert_equal 1 , subject.number_correct
    assert_equal @card_2, subject.current_card
  end
end
