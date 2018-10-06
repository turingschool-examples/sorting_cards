# sorter.rb

class Sorter

  def initialize(deck)
    @deck = deck
  end

  def value_deck
    values_sort_order = {"2" => 0, "3" => 1, "4" => 2, "5" => 3, "6" => 4,
                        "7" => 5, "8" => 6, "9" => 7, "10" => 8, "Jack" => 9,
                        "Queen" => 10, "King" => 11, "Ace" => 12}
    suits_sort_order = {"Clubs" => 0, "Diamonds" => 1,
                        "Hearts" => 2, "Spades" => 3}

    cards_values = {}
    @deck.cards.each do |card|
      cards_values[card] = [values_sort_order[card.value],
                            suits_sort_order[card.suit]]
    end

    return cards_values
  end

  def sort
    cards_values = value_deck

    sorted_cards = []
    # .first creates array of [Card, [value score, suit score]]
    smallest_card = cards_values.first

    cards_values.size do
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
    end

  end

end
