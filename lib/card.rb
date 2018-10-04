class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def overall_value
    card_value + suit_value
  end

  def suit_value
    if @suit == "Clubs"
      index_value = 0.1
    elsif @suit == "Diamonds"
      index_value = 0.2
    elsif @suit == "Spades"
      index_value = 0.3
    else # @suit == "Hearts"
      index_value = 0.4
    end
  end

  def special_card?
    @value.to_i == 0
  end

  def find_special_value
    if @value == "Jack"
      index_value = 11.0
    elsif @value == "Queen"
      index_value = 12.0
    elsif @value == "King"
      index_value = 13.0
    else # @value == "Ace"
      index_value = 14.0
    end
  end

  def card_value
    if special_card?
      find_special_value
    else
      @value.to_f
    end
  end

end
