require_relative 'ui'
require_relative 'standard_playing'
require_relative 'round'
require 'readline'


class FunGuessingGame < UI

  VALUES = Card::FACECARDS.keys + (2..10).map(&:to_s).to_a
  SUITS = Card::SUITDEC.keys

  def self.run
    setup
    # welcome
    repl
  end

  private

  def self.repl
    while true
      print "> "; input = gets.chomp
      break if UI::EXITKEYWORDS.include?(input)
      require'pry'; binding.pry if input == "pry"
      if valid_response?(input)
        new_guess = @round.record_guess(input)
        if new_guess.correct?
        else
        end
      else
        ask_for_valid
      end

    end
  end

  def self.setup
    @deck = StandardPlaying.new()
    @round = Round.new(@deck)
  end

  #print methods
  def self.welcome
    puts "Welcome to Card Guessing Game,
    \t\tthe super fun card guessing game where you guess cards!"
    sleep(1)
    puts "\nFirst, I, Ruby, will select a card..."
    sleep(4)
    puts "\n\t\t...Oh, wow, that's a good one..."
    sleep(0.5)
    puts "(Enter 'o' at any time to see options)"
    puts "\nOkay now, you guess!"
  end

  def self.ask_for_valid
    puts "I'm looking for cards. Something like '3 of Hearts' or 'Ace of Spades'."
  end

  #evaluation methods
  def self.evaluate_wrong_guess(guess)
    info = {}
    info[:value] = evaluate_value(guess)
    info[:suit] = evaluate_suit(guess)
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
    return :diff
  end

  def self.same_color?(suit1, suit2)
    color = %w(Clubs Hearts Diamonds Spades).zip([:b,:r,:r,:b]).to_h
    color[suit1] == color[suit2]
  end


  def self.valid_response?(input)
    a = input.split

    VALUES.include?(a[0]) && "of" == a[1] && SUITS.include?(a[2])
  end




end
