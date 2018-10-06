require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def setup
    @card = Card.new("Ace", "Spades")
  end

  def test_it_exists
    assert_instance_of Card, @card
  end

  def test_it_has_a_value
    assert_equal "Ace", @card.value
  end

  def test_it_has_a_suit
    assert_equal "Spades", @card.suit
  end

  def test_another_card_works
    card = Card.new("8", "Hearts")
    assert_instance_of Card, card
    assert_equal "8", card.value
    assert_equal "Hearts", card.suit
  end

  def test_it_calculates_overall_value_and_returns_float
    card = Card.new("8", "Hearts")
    oa_value = card.overall_value
    assert_instance_of Float, oa_value
    assert_equal 8.4, oa_value
  end

  def test_it_calculates_overall_value_for_face_cards
    card_jack = Card.new("Jack", "Clubs")
    card_queen = Card.new("Queen", "Clubs")
    card_king = Card.new("King", "Clubs")

    assert_equal 11.1, card_jack.overall_value
    assert_equal 12.1, card_queen.overall_value
    assert_equal 13.1, card_king.overall_value
  end

  def test_it_calculates_overall_value_for_ace
    card_ace = Card.new("Ace", "Clubs")
    assert_equal 14.1, card_ace.overall_value
  end

  def test_it_calculates_overall_value_for_suits
    card_clubs = Card.new("8", "Clubs")
    card_diamonds = Card.new("8", "Diamonds")
    card_spades = Card.new("8", "Spades")
    card_hearts = Card.new("8", "Hearts")

    assert_equal 8.1, card_clubs.overall_value
    assert_equal 8.2, card_diamonds.overall_value
    assert_equal 8.3, card_spades.overall_value
    assert_equal 8.4, card_hearts.overall_value
  end

  def test_it_calculates_suit_value
    card_clubs = Card.new("8", "Clubs")
    card_diamonds = Card.new("8", "Diamonds")
    card_spades = Card.new("8", "Spades")
    card_hearts = Card.new("8", "Hearts")

    assert_equal 0.1, card_clubs.suit_value
    assert_equal 0.2, card_diamonds.suit_value
    assert_equal 0.3, card_spades.suit_value
    assert_equal 0.4, card_hearts.suit_value
  end

  def test_it_calculates_special_card_value
    card_jack = Card.new("Jack", "Clubs")
    card_queen = Card.new("Queen", "Diamonds")
    card_king = Card.new("King", "Hearts")
    card_ace = Card.new("Ace", "Spades")

    assert_equal 11.0, card_jack.find_special_value
    assert_equal 12.0, card_queen.find_special_value
    assert_equal 13.0, card_king.find_special_value
    assert_equal 14.0, card_ace.find_special_value

    assert_equal 11.0, card_jack.card_value
    assert_equal 14.0, card_ace.card_value
  end

  def test_it_calculates_number_card_value
    card_4 = Card.new("4", "Hearts")
    card_6 = Card.new("6", "Spades")
    card_9 = Card.new("9", "Diamonds")

    assert_equal 4.0, card_4.card_value
    assert_equal 6.0, card_6.card_value
    assert_equal 9.0, card_9.card_value
  end

  def test_it_can_tell_if_special_card
    card_queen = Card.new("Queen", "Diamonds")
    card_ace = Card.new("Ace", "Spades")
    card_8 = Card.new("8", "Spades")

    assert_equal true, card_queen.special_card?
    assert_equal true, card_ace.special_card?
    assert_equal false, card_8.special_card?
  end

end
