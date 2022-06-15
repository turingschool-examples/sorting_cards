require "./lib/card"
require "./lib/deck"


RSpec.describe(Deck) do
  before(:each) do
    @card_1 = Card.new("3", "Hearts")
    @card_2 = Card.new("4", "Clubs")
    @card_3 = Card.new("5", "Diamonds")
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  it("exists") do
    expect(@deck).to(be_a(Deck))
  end

  it("has all the cards") do
    expect(@deck.cards).to(eq(@cards))
  end

  it("can count the cards") do
    expect(@deck.count).to(eq(3))
  end
end
