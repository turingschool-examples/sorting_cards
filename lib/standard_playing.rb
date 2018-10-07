require_relative 'card'
require_relative 'deck'

class StandardPlaying < Deck

  VALUES = Card::FACECARDS.keys + (2..10).map(&:to_s).to_a
  SUITS = Card::SUITDEC.keys
  
  def initialize()
    @cards = []
    for v in 2..14
      for s in 1..4
        @cards << Card.from_f(v + s / 10.0)
      end
    end
  end

end
