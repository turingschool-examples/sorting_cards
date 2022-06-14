require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

RSpec.describe Round do
  it 'exists' do
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    # binding.pry
    expect(round.deck).to eq(Card)
  end

  it 'has guesses' do
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    expect(round.guesses).to eq([])
  end

  it 'has a current card' do
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    # binding.pry
    expect(round.current_card).to eq("3 of Hearts")
  end

  it 'has a new guess' do
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_guess = round.record_guess({value: "3", suit: "Hearts"})
  end
end
