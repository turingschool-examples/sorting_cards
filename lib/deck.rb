require 'pry'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def sort_setup
    @cards.map do |card|
      [card.overall_value, card]
    end
  end

  def sort(sort_method = "bubble sort")
    case sort_method
    when "bubble sort"
      sorted_oa_value_and_card = bubble_sort(sort_setup)
    when "merge sort"
      sorted_oa_value_and_card = merge_sort(sort_setup)
    when "BRUTE FORCE!!!" # do not use on more than 11 cards!
      sorted_oa_value_and_card = brute_sort(sort_setup)
    end
    sort_teardown(sorted_oa_value_and_card)
  end

  def sort_teardown(sorted_oa_value_and_card)
    sorted_oa_value_and_card.map do |card|
      card[1]
    end
  end

  def brute_sort(sorted_oa_value_and_card) # do not use for more than 11 cards
    sorted_oa_value_and_card.permutation do |perm|
      if correct_order? perm
        return perm
      end
    end
  end

  def correct_order?(sorted_oa_value_and_card)
    (sorted_oa_value_and_card.length - 1).times do |i|
      two_cards = cards_to_compare(sorted_oa_value_and_card, i)
      if two_cards.first[0] > two_cards.last[0]
        return false
      end
    end
    true
  end

  def bubble_sort(sorted_oa_value_and_card)
    until correct_order?(sorted_oa_value_and_card)
      sorted_oa_value_and_card = bubble_iterate_deck(sorted_oa_value_and_card)
    end
    sorted_oa_value_and_card
  end

  def bubble_iterate_deck(sorted_oa_value_and_card)
    (sorted_oa_value_and_card.length - 1).times do |i|
      two_cards = cards_to_compare(sorted_oa_value_and_card, i)
      if two_cards.first[0] > two_cards.last[0] # if should-be-smaller card is larger
        sorted_oa_value_and_card = switch_cards(sorted_oa_value_and_card, i, two_cards)
      end
    end
    sorted_oa_value_and_card
  end

  def switch_cards(sorted_oa_value_and_card, i, two_cards)
    sorted_oa_value_and_card[i + 1] = two_cards.first # switch card locations
    sorted_oa_value_and_card[i] = two_cards.last
    sorted_oa_value_and_card
  end

  def cards_to_compare(sorted_oa_value_and_card, i)
    should_be_smaller_card = sorted_oa_value_and_card[i]
    should_be_larger_card = sorted_oa_value_and_card[i + 1]
    [should_be_smaller_card, should_be_larger_card]
  end

  def merge_sort(sorted_oa_value_and_card)
    dividing_array = sorted_oa_value_and_card.map { |oa_value_and_card| [oa_value_and_card] } # sort into arrays of 1 card

    until merged?(dividing_array)
      dividing_array = merge_arrays(dividing_array)
    end

    dividing_array.flatten(1)
  end

  def merge_arrays(dividing_array)
    intermediate_array = []
    dividing_array << [] if dividing_array.length.odd?
    (0...dividing_array.length / 2).each do |i|
      intermediate_array << merge(dividing_array[i * 2], dividing_array[i * 2 + 1])
    end
    dividing_array = intermediate_array
  end

  def merged?(dividing_array)
    dividing_array.length == 1
  end

  def merge(list_1, list_2)
    merged_list = []
    until list_1.empty? || list_2.empty?
      if list_1.first[0] <= list_2.first[0]
        merged_list.push(list_1.shift)
      else
        merged_list.push(list_2.shift)
      end
    end
    merge_remainder(merged_list, list_1, list_2)
  end

  def merge_remainder(merged_list, list_1, list_2)
    until list_1.empty? && list_2.empty?
      if list_2.empty?
        merged_list.push(list_1.shift)
      else
        merged_list.push(list_2.shift)
      end
    end
    merged_list
  end

end
