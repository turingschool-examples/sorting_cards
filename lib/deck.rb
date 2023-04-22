class Deck
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def count
    @cards.size
  end

  # def sort
  #   sorted = []
  #   while @cards.size > 0
  #     smallest = @cards.min_by { |x| x.point_value}
  #     sorted << @cards.delete(smallest)
  #   end
  #   @cards = sorted
  # end

  def sort
    n = @cards.length

    loop do 
      swapped = false

      (n-1).times do |i|
        if @cards[i].point_value > @cards[i+1].point_value
          @cards[i], @cards[i+1] = @cards[i+1], @cards[i]
          swapped = true
        end
      end
      break if not swapped
    end
    @cards
  end
end
