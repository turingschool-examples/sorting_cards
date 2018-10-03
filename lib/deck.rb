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
      if result.size == 0 || to_int(card) > to_int(result[-1])
        result << card
      else
        result.each_with_index do |c, i|
          if to_int(card) < to_int(c)
            result.insert(i, card); break
          end
        end
      end
    end
    result
  end




  def to_int(card)
    i = card.value.to_i
    return i unless i == 0
    facecards = %w(Jack Queen King Ace).zip(11..14).to_h
    return facecards[card.value]
  end



end
