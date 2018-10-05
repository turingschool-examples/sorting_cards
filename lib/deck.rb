require './lib/card.rb'

class Deck
  attr_reader :cards,
              :card_order

  def initialize(cards)
    @cards = cards
    @card_order = ["2", "3", "4", "5", "6", "7", "8", "9", "10",
                    "Jack", "Queen", "King", "Ace"]
    @suit_order = ["Clubs", "Diamonds", "Hearts", "Spades"]
  end

  def count
    @cards.length
  end

  def next_card
    cards.shift
  end




end
