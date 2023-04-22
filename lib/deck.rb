class Deck
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def count
    @cards.size
  end

  def sort
    sorted = []
    while @cards.size > 0
      smallest = @cards.min_by { |x| x.point_value}
      sorted << @cards.delete(smallest)
    end
    @cards = sorted
  end

  # #  i first created a way to assign each card a numeric value, then 
  # i used a min_by method to iterate through the array of cards and 
  # then pull out the smallest card and put it into a new array while 
  # deleting that card from the old array. Once it has completed iteration 
  # thru the original array it returns the new sorted array. 

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

# But then I wanted to try the bubble sort and for that one you start by 
# figuring out the array length then you create a loop that goes thru and 
# compares the first two numbers if the first number is smaller it's place
# does not change but if the second card is smaller than the first the 
# two cards will be swapped. As each card gets moved swapped becomes true 
# and you tell the loop to stop once there has been no more swapping 

end
