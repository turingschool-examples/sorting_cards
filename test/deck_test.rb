require_relative 'test_helper'


class CardTest < Minitest::Test

  def test_sort
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Ace", "Spades")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Jack", "Clubs")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    assert_equal deck.sort, [card_1, card_3, card_4, card_5, card_2]
  end

  def test__merge_sort
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Ace", "Spades")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Jack", "Clubs")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    assert_equal deck.merge_sort, [card_1, card_3, card_4, card_5, card_2]
  end

  def test__merge_sort_suits
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("4", "Spades")
    card_3 = Card.new("4", "Diamonds")
    card_4 = Card.new("4", "Clubs")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_4, card_3, card_1, card_2, card_5])
    assert_equal deck.merge_sort, [card_1, card_3, card_4, card_5, card_2]
  end

end
