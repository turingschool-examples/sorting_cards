# sorter.rb
require 'pry'

class Sorter

  VALUES_SORT_ORDER = {"2" => 0, "3" => 1, "4" => 2, "5" => 3, "6" => 4,
                      "7" => 5, "8" => 6, "9" => 7, "10" => 8, "Jack" => 9,
                      "Queen" => 10, "King" => 11, "Ace" => 12}
  SUITS_SORT_ORDER = {"Clubs" => 0, "Diamonds" => 1,
                      "Hearts" => 2, "Spades" => 3}

  def initialize(cards)
    @cards = cards
  end

  def score_deck
    # Assigns each Card a "score" array and stores it with the
    # Card in cards_scores hash.
    cards_scores = {}
    @cards.each do |card|
      cards_scores[card] = [VALUES_SORT_ORDER[card.value],
                            SUITS_SORT_ORDER[card.suit]]
    end
    return cards_scores
  end

  def sort
    cards_values = score_deck
    sorted_cards = []
    # .first creates array of [Card, [value score, suit score]]
    smallest_card = cards_values.first
    cards_values.size.times do
      cards_values.each do |card, score|
        if score[0] < smallest_card[1][0]
          smallest_card = [card, score]
        elsif score[0] == smallest_card[1][0]
          if score[1] < smallest_card[1][1]
            smallest_card = [card, score]
          end
        end
      end
      sorted_cards << smallest_card[0]
      cards_values.delete(smallest_card[0])
      smallest_card = cards_values.first
    end
    sorted_cards
  end

end
