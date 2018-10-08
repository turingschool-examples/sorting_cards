# sorter.rb
require './lib/score_cards'
require 'pry'

class Sorter
  include ScoreCards

  def initialize(cards)
    @cards = cards
  end

  def sort
    cards_values = score_cards(@cards)
    sorted_cards = []
    smallest_card = cards_values.first

    cards_values.size.times do
      smallest_card = get_smallest_card(cards_values, smallest_card)
      sorted_cards << smallest_card[0]
      cards_values.delete(smallest_card)
      smallest_card = cards_values.first
    end
    sorted_cards
  end

  def get_smallest_card(cards_values, smallest_card)
    cards_values.each do |card|
      smallest_card = test_card_value(card[0], card[1], smallest_card)
    end
    smallest_card
  end

  def test_card_value(card, score, smallest_card)
    smallest_card_score = smallest_card[1]
    if score < smallest_card_score
      smallest_card = [card, score]
    end
    smallest_card
  end

end
