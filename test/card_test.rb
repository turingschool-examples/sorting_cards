require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
# require './lib/deck'
require 'pry'

class CardTest < Minitest::Test
  def test_it_exists
    card = Card.new("Ace", "Spades")
    assert_instance_of Card, card
  end

  def test_it_has_a_value
    card = Card.new("Ace", "Spades")
    assert_equal "Ace", card.value
  end

  def test_it_has_a_suit
    card = Card.new("Ace", "Spades")
    assert_equal "Spades", card.suit
  end

  def test_it_can_assign_integer_values_to_cards
    card = Card.new("4","Hearts")
    #binding.pry
    assert_equal 43, card.assign_value
  end

end



#
# card_1 = Card.new("4","Hearts")
# card_2 = Card.new("Ace", "Spades")
# card_3 = Card.new("5", "Diamonds")
# card_4 = Card.new("Jack", "Clubs")
# card_5 = Card.new("Ace", "Diamonds")
# deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
# assert_equal ([43, 144, 52, 111, 142]), card.assign_value
# end
