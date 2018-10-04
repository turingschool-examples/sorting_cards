class Card
  attr_reader :value, :suit, :card_weight

  def calculate_value_weight(value)
    value_weights = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king", "ace"]
    matching_value_weight = nil

    value_weights.each_with_index do |value_weight, index|
      if value_weight == value.downcase
        matching_value_weight =  index + 1
      end
    end
    
    matching_value_weight
  end

  def calculate_suit_weight(suit)
    suit_weights = ["clubs", "diamonds", "hearts", "spades"]
    matching_suit_weight = nil

    suit_weights.each_with_index do |suit_weight, index|
      if suit_weight == suit.downcase
        matching_suit_weight =  index + 1
      end
    end
    
    matching_suit_weight
  end

  def calculate_total_weight(value, suit)
    value_weight = calculate_value_weight(value)
    suit_weight = calculate_suit_weight(suit)

    "#{value_weight}.#{suit_weight}".to_f
  end


  def initialize(value, suit)
    @suit = suit.downcase
    @value = value.downcase
    @card_weight = calculate_total_weight(@value, @suit)
  end
end
