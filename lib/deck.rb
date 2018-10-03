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
      if result.size == 0 || card.to_i > result[-1].to_i
        result << card
      else
        result.each_with_index do |c, i|
          if card.to_i < c.to_i
            result.insert(i, card); break
          end
        end
      end
    end
    result
  end








end
