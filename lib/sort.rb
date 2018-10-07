class Sort
  attr_reader :deck

  def initialize(deck)
    @deck = deck
  end

  def sort
    swap = true
      while swap do
        swap = false
        0.upto(deck.count + 2).times do |switch|
          if deck.count[switch].value <=> deck.count[switch + 1].value = -1
            if deck.count[switch].value == "Ace"
              deck.count[switch], deck.count[switch + 1] = deck.count[switch + 1], deck.count[switch]
              swap = true
            elsif deck.count[switch + 1].value == "Ace"
              #Do nothing
            elsif deck.count[switch] == "King"
              deck.count[switch], deck.count[switch + 1] = deck.count[switch + 1], deck.count[switch]
              swap = true
            elsif deck.count[switch + 1] == "King"
              #do nothing
            elsif deck.count[switch] == "Queen"
              deck.count[switch], deck.count[switch + 1] = deck.count[switch + 1], deck.count[switch]
              swap = true
            elsif deck.count[switch + 1] == "Queen"
              #do nothing
            else
              deck.count[switch], deck.count[switch + 1] = deck.count[switch + 1], deck.count[switch]
            end

          elsif deck.count[switch].value <=> deck.count[switch + 1].value = 0
            if deck.count[switch].suit == "Spades"
              deck.count[switch], deck.count[switch + 1] = deck.count[switch + 1], deck.count[switch]
              swap = true
            elsif deck.count[switch + 1].suit == "Spades"
              #Do nothing
            elsif deck.count[switch].suit == "Hearts"
              deck.count[switch], deck.count[switch + 1] = deck.count[switch + 1], deck.count[switch]
              swap = true
            elsif deck.count[switch + 1].suit == "Hearts"
              #Do nothing
            elsif deck.count[switch].suit == "Diamonds"
              deck.count[switch], deck.count[switch + 1] = deck.count[switch + 1], deck.count[switch]
              swap = true
            elsif deck.count[switch + 1].suit == "Diamonds"
            end

          elsif deck.count[switch].value <=> deck.count[switch + 1].value = 1
            if deck.count[switch].value == "Ace"
              deck.count[switch], deck.count[switch + 1] = deck.count[switch + 1], deck.count[switch]
              swap = true
            elsif deck.count[switch + 1] == "Ace"
              #do nothing
            elsif deck.count[switch] == "King"
              deck.count[switch], deck.count[switch + 1] = deck.count[switch + 1], deck.count[switch]
              swap = true
            elsif deck.count[switch + 1].value == "King"
              #Do nothing
            elsif deck.count[switch].value == "Queen"
              deck.count[switch], deck.count[switch + 1] = deck.count[switch + 1], deck.count[switch]
              swap = true
            elsif deck.count[switch + 1].value == "Queen"
            end
          end
        end
      end
  end
end
