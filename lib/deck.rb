
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.size
  end

  def shuffle!
    @cards = @cards.shuffle!
    nil
  end


  #everything below is a sort method
  def sort
    result = []
    cards.each do|card|
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

  def bubble_sort
    loop do
      still_sorting = :maybe
      @cards.each_with_index do |c, i|
        if i > 0 && c.to_f < @cards[i - 1].to_f
          @cards[i], @cards[i - 1] = @cards.values_at(i - 1, i)
          still_sorting = true
        end
      end
      return @cards unless still_sorting == true
    end
  end

  def merge_sort(other = nil)
    cards = self.cards
    if other
      result = []
      (other.size + cards.size).times do
        # require 'pry'; binding.pry
        if cards.empty?
          return result += other
        elsif other.empty?
          return result += cards
        end

        if cards[0].to_f < other[0].to_f
          result << cards.shift
        else
          result << other.shift
        end
      end
    else
      result = cards.map{|el| [el]}


      Math.log2(result.size).ceil.times do
        new_result = []
        result.each_slice(2).map do |a,b|
          if b == nil
            new_result << a
          else
            new_result << Deck.new(a).merge_sort(b)
          end
        end

        result = new_result

      end
    end
    result[0]
  end

end
