class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    if cards.kind_of?(Array)
      @cards.count
    else
      "Error: deck.cards is not an Array"
    end
  end

  def sort
    cards_copy = @cards.dup
    (cards_copy.count - 1).times do |x|
      (cards_copy.count - 1 - x).times do |i|
        if cards_copy[i].card_weight > cards_copy[i+1].card_weight
          cards_copy[i], cards_copy[i+1] = cards_copy[i+1], cards_copy[i]
        end
      end
    end
    cards_copy
  end

  def merge_sort
    cards_copy = @cards.dup
    seperate(cards_copy)
  end

  def seperate(cards)
    if cards.count <= 1
      cards
    else
      mid = (cards.count / 2)
      left = seperate(cards[0..mid - 1])
      right = seperate(cards[mid..cards.count])
      merge(left, right)
    end
  end

  def merge(left, right)
    if left.empty?
      right
    elsif right.empty?
      left
    elsif left[0].card_weight < right[0].card_weight
      [left[0]] + merge(left[1..left.count], right)
    else
      [right[0]] + merge(left, right[1..right.count])
    end
  end
end