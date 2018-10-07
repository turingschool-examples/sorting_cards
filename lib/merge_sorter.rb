require 'pry'

class MergeSorter

  VALUES_SORT_ORDER = {"2" => 0, "3" => 1, "4" => 2, "5" => 3, "6" => 4,
                      "7" => 5, "8" => 6, "9" => 7, "10" => 8, "Jack" => 9,
                      "Queen" => 10, "King" => 11, "Ace" => 12}
  SUITS_SORT_ORDER = {"Clubs" => 0, "Diamonds" => 1,
                      "Hearts" => 2, "Spades" => 3}

  def initialize(cards)
    @cards = score_cards(cards)
  end

  def score_cards(cards)
    cards.map do |card|
      value_score = VALUES_SORT_ORDER[card.value]
      suit_score = SUITS_SORT_ORDER[card.suit]
      [card, "#{value_score}.#{suit_score}".to_f]
    end
  end

  def merge_sort_and_resolve
    merged_cards = merge_sort(@cards)
    merged_cards.map do|card|
      card[0]
    end
  end


  def merge_sort(cards)

    if cards.size == 1
      return cards
    end

    midpoint = cards.size / 2

    left_list = cards[0..(midpoint - 1)]
    right_list = cards[midpoint..-1]

    sorted_left = merge_sort(left_list)
    sorted_right = merge_sort(right_list)

    merged_cards = merge(sorted_left, sorted_right)
  end

  def merge(left_list, right_list)
    sorted_list = []

    (left_list.size + right_list.size).times do
      if left_list[0][1] < right_list[0][1]
        sorted_list << left_list.shift
      else
        sorted_list << right_list.shift
      end

      if left_list == [] || right_list == []
        add_rest_of_cards(left_list, right_list, sorted_list)
        break
      end
    end
    sorted_list
  end

  def add_rest_of_cards(left_list, right_list, sorted_list)
    if left_list == []
      right_list.length.times do
        sorted_list << right_list.shift
      end
    else
      left_list.length.times do
        sorted_list << left_list.shift
      end
    end
    sorted_list
  end

end
