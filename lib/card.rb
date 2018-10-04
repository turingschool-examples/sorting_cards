class Card
  SPECIAL_VALUES = {
    jack: 11,
    queen: 12,
    king: 13,
    ace: 14
  }
  SUIT_VALUES = {
    clubs: 0,
    diamonds: 1,
    hearts: 2,
    spades: 3
  }
  attr_reader :value, :suit
  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def <=>(other)
    self_value, other_value = standardize_all_values(other.value)
    self_suit, other_suit = standardize_all_suits(other.suit)
    compare = self_value <=> other_value
    compare = self_suit <=> other_suit if compare == 0
    compare
  end

  def <(other)
    (self <=> other) == -1
  end

  def >(other)
    (self <=> other) == 1
  end

  def standardize_card_attribute(value_or_suit)
    if special_value?(value_or_suit)
      standardized = SPECIAL_VALUES[value_or_suit.to_s.downcase.to_sym]
    elsif suit?(value_or_suit)
      standardized = SUIT_VALUES[value_or_suit.to_s.downcase.to_sym]
    else
      standardized = value_or_suit.to_i
    end
    standardized
  end

  def standardize_all_values(other_value)
    self_value = standardize_card_attribute(value)
    other_value = standardize_card_attribute(other_value)
    return self_value, other_value
  end

  def standardize_all_suits(other_suit)
    self_suit = standardize_card_attribute(suit)
    other_suit = standardize_card_attribute(other_suit)
    return self_suit, other_suit
  end

  def special_value?(value)
    SPECIAL_VALUES.key?(value.to_s.downcase.to_sym)
  end

  def suit?(value)
    SUIT_VALUES.key?(value.to_s.downcase.to_sym)
  end
end
