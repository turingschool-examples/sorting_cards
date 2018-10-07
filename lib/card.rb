class Card
attr_reader :value, :suit
   def initialize(value, suit)

     @value = value
     @suit = suit
     @new_value = {"2" => 2, "3" =>3, "4" => 4, "5" => 5,
        "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10"=> 10,
         "Jack" => 11, "Queen" => 12,"King" => 13, "Ace" => 14}
     @suit_value = {"Spades" => 4, "Hearts" => 3, "Diamonds" => 2, "Clubs" => 1}

   end

   def add_keys_and_values
     (@new_value[value] * 10) + @suit_value [suit]
   end

end
