class Card
  SUITDEC = {"Clubs"=>0.1, "Diamonds"=>0.2, "Hearts"=>0.3, "Spades"=>0.4}
  FACECARDS = {"Jack"=>11, "Queen"=>12, "King"=>13, "Ace"=>14}



  attr_reader :value, :suit, :to_f
  def initialize(value, suit, float = nil)
    @value = value
    @suit = suit
     if float
       @to_f = float
     else
       @to_f = to_float
     end

  end

  def self.from_f(float)

    suit = SUITDEC.key (float % 1).round(1)
    value = float > 10 ? FACECARDS.key(float.round) : float.round.to_s

    Card.new(value, suit, float)
  end

  private

  def to_float
    val_f = value.to_f
    suit_f = SUITDEC[suit]
    return val_f + suit_f unless val_f == 0.0
    return FACECARDS[value] + suit_f
  end


end
