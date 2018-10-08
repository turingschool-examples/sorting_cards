class Sort
  attr_reader :deck, :sort

  def initialize(deck)
    @deck = deck
  end

  def self.sort
    swap = true
      loop do
        if swap == true
          break
        end
        swap = false
        #(@deck.count + 2)
        52.times do |switch|
          if deck.cards[switch].value <=> deck.cards[switch + 1].value = -1
            if deck.cards[switch].value == "Ace"
              deck.cards[switch], deck.cards[switch + 1] = deck.cards[switch + 1], deck.cards[switch]
              swap = true
            elsif deck.cards[switch + 1].value == "Ace"
              #Do nothing
            elsif deck.cards[switch] == "King"
              deck.cards[switch], deck.cards[switch + 1] = deck.cards[switch + 1], deck.cards[switch]
              swap = true
            elsif deck.cards[switch + 1] == "King"
              #do nothing
            elsif deck.cards[switch] == "Queen"
              deck.cards[switch], deck.cards[switch + 1] = deck.cards[switch + 1], deck.cards[switch]
              swap = true
            elsif deck.cards[switch + 1] == "Queen"
              #do nothing
            else
              deck.cards[switch], deck.cards[switch + 1] = deck.cards[switch + 1], deck.cards[switch]
            end

          elsif deck.cards[switch].value <=> deck.cards[switch + 1].value = 0
            if deck.cards[switch].suit == "Spades"
              deck.cards[switch], deck.cards[switch + 1] = deck.cards[switch + 1], deck.cards[switch]
              swap = true
            elsif deck.cards[switch + 1].suit == "Spades"
              #Do nothing
            elsif deck.cards[switch].suit == "Hearts"
              deck.cards[switch], deck.cards[switch + 1] = deck.cards[switch + 1], deck.cards[switch]
              swap = true
            elsif deck.cards[switch + 1].suit == "Hearts"
              #Do nothing
            elsif deck.cards[switch].suit == "Diamonds"
              deck.cards[switch], deck.cards[switch + 1] = deck.cards[switch + 1], deck.cards[switch]
              swap = true
            elsif deck.cards[switch + 1].suit == "Diamonds"
            end

          elsif deck.cards[switch].value <=> deck.cards[switch + 1].value = 1
            if deck.cards[switch].value == "Ace"
              deck.cards[switch], deck.cards[switch + 1] = deck.cards[switch + 1], deck.cards[switch]
              swap = true
            elsif deck.cards[switch + 1] == "Ace"
              #do nothing
            elsif deck.cards[switch] == "King"
              deck.cards[switch], deck.cards[switch + 1] = deck.cards[switch + 1], deck.cards[switch]
              swap = true
            elsif deck.cards[switch + 1].value == "King"
              #Do nothing
            elsif deck.cards[switch].value == "Queen"
              deck.cards[switch], deck.cards[switch + 1] = deck.cards[switch + 1], deck.cards[switch]
              swap = true
            elsif deck.cards[switch + 1].value == "Queen"

            end
          end
         end
      end
  end
end
