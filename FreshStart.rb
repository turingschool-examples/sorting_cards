require 'pry'

class Card
  attr_reader :suit, :value
  def initialize(value, suit)
    @suit = suit
    @value = value
  end
end

class Guess
  attr_reader :response, :card
  def initialize(response, card) #(where card is a new instance of the Card class)
    @response = response #(in form "value of suit")
    @card = card
  end

  def correct?
    if @response == "#{@card.value} of #{@card.suit}"
      true
    else
      false
    end
  end

  def feedback
    if correct? == true
      p "Correct!"
    else
      p "Incorrect."
    end
  end
end

class Deck
  attr_accessor :cards
  def initialize(cards) #where cards = an array of Card Class instances
    @cards = cards
  end


  def count
    @cards.length
  end

  def sort
    array = @cards
  	index_length = array.length
  	suit_hash = {"Clubs":1, "Diamonds":2, "Hearts":3, "Spades":4}
  	all_card_hash = {"2":2,"3":3, "4":4, "5":5, "6":6, "7":7, "8":8, "9":9, "10":10, "Ace":14, "Jack":11, "Queen":12, "King":13}
  	# hash_key = array[index].value
  	if index_length <= 1 # if index is empty or only has one element - return array
  		return array
  	end

  	loop do

  		swap = false # there have been no swaps yet in the loop yet (swap detemines when sort ends)

  		(index_length - 1).times do |index| #length - 1 => you dont want to swap the last item in the array with the first

  			first_card_key = array[index].value.to_sym
  			second_card_key = array[index + 1].value.to_sym
  			if all_card_hash[first_card_key] > all_card_hash[second_card_key]
  				array[index], array[index + 1] = array[index + 1], array[index]
  				swap = true
  			elsif array[index].value == array[index + 1].value
  				swap = false #because the suits still need swapped
  				first_suit_key = array[index].suit.to_sym
  				second_suit_key = array[index + 1].suit.to_sym
  				if suit_hash[first_suit_key] > suit_hash[second_suit_key]
  					array[index], array[index + 1] = array[index + 1], array[index]
  					swap = true #because you swapped
  				end
  			end
  		end

  		if swap == false
  			# break
  			return array
  		end

  	end
  	# array
  end


    def split(cards)
      suit_hash = {"Clubs":1, "Diamonds":2, "Hearts":3, "Spades":4}
      all_card_hash = {"2":2,"3":3, "4":4, "5":5, "6":6, "7":7, "8":8, "9":9, "10":10, "Ace":14, "Jack":11, "Queen":12, "King":13}
      if cards.length <= 1
        cards
      else
        mid_point = (cards.length / 2).floor
        left_side = split(cards[0..mid_point - 1]) # recursively splits this side array until it's an array of an arrays
        right_side = split(cards[mid_point..cards.length]) # ^-- same but for the right side
        merge(left_side, right_side) # takes the arrays of arrays & recursively sorts them
      end
    end


    def merge(left, right) # takes the left and right side and recursively sorts them until an array is returned
      suit_hash = {"Clubs":1, "Diamonds":2, "Hearts":3, "Spades":4}
      all_card_hash = {"2":2,"3":3, "4":4, "5":5, "6":6, "7":7, "8":8, "9":9, "10":10, "Ace":14, "Jack":11, "Queen":12, "King":13}
      first_card_key = left[0].value.to_sym
      second_card_key = right[0].value.to_sym


      if left.empty?
        right
      elsif right.empty?
        left
      elsif all_card_hash[first_card_key] < all_card_hash[second_card_key]
        [left.first] + merge(left[1 .. left.length], right)
      else
        [right.first] + merge(left, right[1 .. right.length])
      end
    end

end

class Round
  attr_reader :current_card, :guesses, :deck

  def initialize(deck)
    @deck = deck
    @guesses = []

  end

  # def guesses
  # @guesses
  # end

  def current_card
    card_counter = @guesses.count #
    @deck.cards[card_counter]
  end

  def record_guess(hash)
    guess_card = "#{hash[:value]} of #{hash[:suit]}"
    guess = Guess.new(guess_card, current_card)
    @guesses << guess
    # @deck.rotate(1)

    # @counter + 1
    guess
  end

  # def correct?
  #   if record_guess == current_card
  #     #@correct =+ 1
  #     true
  #   else
  #     false
  #   end
  # end

  def number_correct
    correct_counter = 0
    @guesses.each do |guess|
      if guess.correct? # == true
        correct_counter += 1
      end
    end

    # if correct? == true
    #   correct =+ 1
    # end
    correct_counter
  end

  def percent_correct
    percent = (number_correct.to_f / @guesses.count) * 100
    "#{percent} % correct"

  end




  #def record
end


card_1 = Card.new("4","Hearts")
card_2 = Card.new("Ace", "Spades")
card_3 = Card.new("5", "Diamonds")
card_4 = Card.new("Jack", "Clubs")
card_5 = Card.new("Ace", "Diamonds")
cards = [card_1, card_2, card_3, card_4, card_5]
deck = Deck.new(cards)



# card_1 = Card.new("3","Hearts")
# card_2 = Card.new("4", "Clubs")
# deck = Deck.new([card_1, card_2])
# round = Round.new(deck)

binding.pry
