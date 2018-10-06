require_relative 'ui'
require_relative 'standard_playing'
require_relative 'round'


class GuessingGame < UI

  def self.run
    init
    # welcome
    repl
  end

  private

  def self.repl

  end

  def self.init
    @deck = StandardPlaying.new()
    @round = Round.new(@deck)
  end

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

end
