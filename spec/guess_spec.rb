require './lib/card'
require './lib/guess'
require 'rspec'

RSpec.describe Guess do
  let(:ten_of_hearts) {Card.new("10", "Hearts")}

  it "exists and has attributes" do
    guess = Guess.new("10 of Hearts", ten_of_hearts)
    expect(guess).to be_instance_of(Guess)
    expect(ten_of_hearts).to be_instance_of(Card)
  end

  xit 'can make a guess' do 
    guess = Guess.new("10 of Hearts", ten_of_hearts)
    expect(guess.card).to eq(ten_of_hearts)
  end
  
  xit "can give feedback for a guess" do
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("Queen of Clubs", card)
    expect(guess.card).to eq(card)
    expect(guess.response).to eq("Queen of Clubs")
    expect(guess.correct?).to eq(true)
    expect(guess.feedback).to eq("Correct!")
        
    guess2 = Guess.new("Ace of Spades", card)
    expect(guess2.card).to eq(card)
    expect(guess2.response).to eq("Ace of Spades")
    expect(guess2.correct?).to eq(false)
    expect(guess2.feedback).to eq("Incorrect.")
  end
end
