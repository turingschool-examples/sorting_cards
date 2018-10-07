require_relative 'standard_playing'
require_relative 'guess'

class Evaluation

  def self.evaluate_wrong_guess(guess)
    info = {}
    info[:value] = evaluate_value(guess)
    info[:suit] = evaluate_suit(guess)
    info
  end

  def self.evaluate_value(guess)
    gval, cval = guess.g_card.to_f.round, guess.card.to_f.round
    return :same if gval == cval
    return :high if gval > cval
    return :low
  end

  def self.evaluate_suit(guess)
    gsuit, csuit = guess.g_card.suit, guess.card.suit
    return :same if gsuit == csuit
    return :same_color if same_color?(gsuit, csuit)
    return :diff_color
  end

  def self.same_color?(suit1, suit2)
    color = %w(Clubs Hearts Diamonds Spades).zip([:b,:r,:r,:b]).to_h
    color[suit1] == color[suit2]
  end


  def self.valid_response?(input)
    a = input.split
    vals = StandardPlaying::VALUES; suits = StandardPlaying::SUITS
    vals.include?(a[0]) && "of" == a[1] && suits.include?(a[2])
  end

end
