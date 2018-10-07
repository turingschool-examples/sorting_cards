require 'pry'

class MergeSorter

  VALUES_SORT_ORDER = {"2" => 0, "3" => 1, "4" => 2, "5" => 3, "6" => 4,
                      "7" => 5, "8" => 6, "9" => 7, "10" => 8, "Jack" => 9,
                      "Queen" => 10, "King" => 11, "Ace" => 12}
  SUITS_SORT_ORDER = {"Clubs" => 0, "Diamonds" => 1,
                      "Hearts" => 2, "Spades" => 3}

  def initialize(cards)
    @cards = cards
  end

  def score_cards
    @cards.map do |card|
      value_score = VALUES_SORT_ORDER[card.value]
      suit_score = SUITS_SORT_ORDER[card.suit]
      [card, "#{value_score}.#{suit_score}"]
    end
  end

  def merge_sort
  end

  def merge(left_list, right_list)
    sorted_list = []

    total_length = left_list.size + right_list.size

    total_length.times do

      if left_list[0][1] < right_list[0][1]
        sorted_list << left_list.shift
      else
        sorted_list << right_list.shift
      end
      if left_list.length == 0
        sorted_list << right_list
    end
    sorted_list
  end
end

end
