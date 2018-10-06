require 'pry'
require 'pp'

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
      sorted_oa_values = bubble_sort(sort_setup)
    when "merge sort"
      sorted_oa_values = merge_sort(sort_setup)
    when "BRUTE FORCE!!!"
      sorted_oa_values = brute_sort(sort_setup)
    end
    sort_teardown(sorted_oa_values)
  end

  def brute_sort(sorted_deck_numbered)
    sorted_deck_numbered.permutation do |perm|
      if correct_order?(perm)
        return perm
      end
    end
  end

  def correct_order?(sorted_deck_numbered)
    (0...sorted_deck_numbered.length - 1).each do |i|
      if sorted_deck_numbered[i][0] > sorted_deck_numbered[i + 1][0]
        return false
      end
    end
    true
  end

  def bubble_sort(sorted_deck_numbered)
    deck_sorted = false

    until deck_sorted
      deck_sorted = true
      (sorted_deck_numbered.length - 1).times do |i|
        if sorted_deck_numbered[i][0] > sorted_deck_numbered[i + 1][0]
          deck_sorted = false
          card_to_switch = sorted_deck_numbered[i + 1]
          sorted_deck_numbered[i + 1] = sorted_deck_numbered[i]
          sorted_deck_numbered[i] = card_to_switch
        end
      end
    end
    sorted_deck_numbered
  end

  def merge_sort(sorted_deck_numbered)
    # list_1 = sorted_deck_numbered[0..sorted_deck_numbered.length / 2 - 1]
    # list_2 = sorted_deck_numbered[sorted_deck_numbered.length / 2..-1]

    # dividing_array = [sorted_deck_numbered]
    dividing_array = sorted_deck_numbered.clone

    # until no_more_split?(dividing_array)
    #   split_arrays = []
    #   dividing_array.each do |ary|
    #     split_arrays << merge_split(ary)[0]
    #     split_arrays << merge_split(ary)[1]
    #   end
    #   dividing_array = split_arrays
    # end
    dividing_array.map! do |ary|
      [ary]
    end

    until merged?(dividing_array)
      intermediate_array = []
      if dividing_array.length.odd?
        dividing_array << []
      end
      (0...dividing_array.length / 2).each do |i|
        intermediate_array << merge(dividing_array[i * 2], dividing_array[i * 2 + 1])
      end
      dividing_array = intermediate_array
    end
    dividing_array.flatten(1)
  end

  def merged?(dividing_array)
    dividing_array.length == 1
  end

  def no_more_split?(dividing_array)
    dividing_array.last.length <= 1
  end

  def merge_split(dividing_array)
    output_array = []
    output_array[0] = dividing_array[0..dividing_array.length / 2 - 1]
    output_array[1] = dividing_array[dividing_array.length / 2..-1]
    output_array
  end

  def merge(list_1, list_2)
    merged_list = []
    until list_1.empty? || list_2.empty?
      if list_1[0][0] <= list_2[0][0]
        merged_list.push(list_1.shift)
      else
        merged_list.push(list_2.shift)
      end
    end
    if list_1.empty?
      until list_2.empty?
        merged_list.push(list_2.shift)
      end
    end
    if list_2.empty?
      until list_1.empty?
        merged_list.push(list_1.shift)
      end
    end
    merged_list
  end

  def sort_teardown(sorted_deck_numbered)
    sorted_deck_numbered.map do |card|
      card[1]
    end
  end

end
