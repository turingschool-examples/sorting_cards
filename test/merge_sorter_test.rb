require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/merge_sorter'

class MergeSorterTest < Minitest::Test

def setup
  @card_1 = Card.new("4","Hearts")
  @card_2 = Card.new("Ace", "Spades")
  @card_3 = Card.new("5", "Diamonds")
  @card_4 = Card.new("Jack", "Clubs")
  @card_5 = Card.new("Ace", "Diamonds")
  @deck = Deck.new([@card_1, @card_2, @card_3, @card_4, @card_5])
end

def test_it_exists
  assert_instance_of MergeSorter, MergeSorter.new
end




end
