
class Card
attr_reader :value, :suit

  def initialize(value, suit)

      @value = value
      @suit = suit
      @card_values = {"2" => 20,"3" => 30,"4" => 40,"5" => 50,"6" => 60,"7" => 70,"8" => 80,"9" => 90,"10" => 100,"Jack" => 200,"Queen" => 300,"King" => 400,"Ace" => 500}
      @suit_values = {"Clubs" => 1, "Diamonds" => 2, "Hearts" => 3, "Spades" => 4}
  end

  def actual_value
    @card_values[value] + @suit_values[suit]
  end
end
