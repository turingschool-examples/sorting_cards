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
    assert_equal @deck.cards[0], subject.current_card
  end

  def test_a_correct_guess_can_be_recorded
    subject = Round.new(@deck)
    assert_equal subject.guesses, []
    new_guess = subject.record_guess({value: "3", suit: "Hearts"})
    assert_instance_of Guess, new_guess
    assert_equal true, new_guess.correct?
    assert_equal [new_guess], subject.guesses
    assert_equal 1 , subject.number_correct
  end

  def test_that_current_card_changes_with_every_round
    subject = Round.new(@deck)
    new_guess = subject.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal @deck.cards[1], subject.current_card
  end

  def test_a_incorrect_guess
    subject = Round.new(@deck)
    assert_equal subject.guesses, []
    new_guess = subject.record_guess({value: "4", suit: "Hearts"})
    assert_instance_of Guess, new_guess
    assert_equal false, new_guess.correct?
    assert_equal "Incorrect!", subject.guesses.last.feedback
    assert_equal [new_guess], subject.guesses
    assert_equal 0 , subject.number_correct
  end

  def test_percent_of_correct_guesses
    subject = Round.new(@deck)
    subject.record_guess({value: "4", suit: "Hearts"})
    subject.record_guess({value: "4", suit: "Clubs"})
    assert_equal 50.0, subject.percent_correct
  end
end
