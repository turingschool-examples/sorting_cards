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



end


class Array
  def merge_sort(other = nil)
    if other
      result = []
      (other.size + self.size).times do
        # require 'pry'; binding.pry
        if self.empty?
          return result += other
        elsif other.empty?
          return result += self
        end

        if self[0] < other[0]
          result << self.shift
        else
          result << other.shift
        end
      end
    else
      result = self.map{|el| [el]}


      Math.log2(result.size).ceil.times do
        new_result = []
        result.each_slice(2).map do |a,b|
          if b == nil
            new_result << a
          else
            new_result << a.merge_sort(b)
          end
        end

        result = new_result

      end
    end
    result[0]
  end

end
