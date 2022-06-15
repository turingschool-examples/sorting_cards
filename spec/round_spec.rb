require "./lib/card"
require "./lib/deck"
require "./lib/round"
require "./lib/guess"


RSpec.describe(Round) do
  before(:each) do
    @card_1 = Card.new("3", "Hearts")
    @card_2 = Card.new("4", "Clubs")
    @deck = Deck.new([@card_1, @card_2])
    @round = Round.new(@deck)
  end

  it("exists") do
    expect(@round.deck).to(be_a(Deck))
  end

  it("has a space to store guesses") do
    expect(@round.guesses).to(eq([]))
  end

  it("can check the current_card") do
    expect(@round.current_card).to(eq(@card_1))
  end

  it(" record_guesses") do
    @new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    expect(@round.guesses.count).to(eq(1))
  end

  it("new_guess is a Guess class") do
    @new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    expect(@new_guess.class).to(eq(Guess))
  end

  it("new guess is correct") do
    @new_guess = @round.record_guess({value: "3", suit: "Hearts"})
    expect(@new_guess.correct?).to(eq(true))
  end
end
