require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Deck do
  it 'exists' do
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck).to be_an_instance_of(Deck)
  end

  it 'has cards' do
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck.cards).to eq(cards)
    expect(deck.count).to eq(3)
    # expect(card).to be_instance_of(Deck)
    # binding.pry


  end
end
