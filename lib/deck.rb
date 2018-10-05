class Deck
  attr_accessor :cards
  def initialize(*cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def sort(sort_direction = {reverse: false})
    sorted = false
    until sorted
      cards_duplicate = cards.dup
      n = cards.length
      (n-1).times do |i|
        if sort_direction[:reverse]
          check_for_swap(i, true)
        else
          check_for_swap(i)
        end
      end
      sorted = true if cards_duplicate == cards
    end
  end

  def merge_sort(array, sort_direction = {reverse: false})
    array_a, array_b, sorted = [], [], []
    until array.empty?
      n = array.length

      if n >= 4
        array_a, array_b = split_array(array)
        sorted = sort_into_one(array_a, array_b)
      elsif n == 3
        array_a = sort_array(array.slice!(0, 2))
        array_b = array[0]
        sorted = sort_into_one(array_a, array_b)
      elsif n == 2
        array_a = sort_array(array)
        sorted = sort_into_one(sorted, array_a)
      else
        sorted = sort_into_one(sorted, array)
      end
    end

  end

  def sort_into_one(array_a, array_b)
    sorted = []
    until array_a.empty? && array_b.empty?
      if array_a[0] <= array_b[0]
        sorted.push(array_a.slice!(0,1))
      else
        sorted.push(array_b.slice!(0,1))
      end
    end
    sorted
  end

  def split_array(array)
    array_a = sort_array(array.slice!(0,2))
    array_b = sort_array(array.slice!(0,2))

    return array_a, array_b
  end

  def sort_array(array)
    sorted = []
    if array[0] <= array[1]
      sorted[0], sorted[1] = array[0], array[1]
    else
      sorted[0], sorted[1] = array[1], array[0]
    end
    sorted
  end

  def check_for_swap(i, reverse = false)
    if reverse
      if cards[i] < cards[i+1]
        cards[i], cards[i+1] = cards[i+1], cards[i]
      end
    else
      if cards[i+1] < cards[i]
        cards[i], cards[i+1] = cards[i+1], cards[i]
      end
    end
  end

end
