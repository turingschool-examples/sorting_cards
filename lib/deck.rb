
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.size
  end

  def sort
    result = []
    @cards.each do|card|
      if result.size == 0 || card.to_f > result[-1].to_f
        result << card
      else
        result.each_with_index do |c, i|
          if card.to_f < c.to_f
            result.insert(i, card); break
          end
        end
      end
    end
    result
  end

  include MergeSortable

end
