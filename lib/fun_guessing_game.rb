require_relative 'ui'
require_relative 'standard_playing'
require_relative 'round'
require_relative 'evaluation'
require 'readline'
require'pry'


class FunGuessingGame < UI

  CORRECT_REACTIONS = ["Isn't this game fun?", "Are you psychic?", "Incredible!"].shuffle.cycle
  INCORRECT_REACTIONS = ["Not it.", "Not the card I was thinking of.", "Nope."].shuffle.cycle
  TOO_LOW_HINTS = ["Why so low?", "Think bigger."].shuffle.cycle
  TOO_HIGH_HINTS = ["That guess was just too much.", "Think smaller."].shuffle.cycle
  DIFF_COLOR_HINTS = ["You didn't even get the color right", "Wrong color."].shuffle.cycle
  DIFF_SUIT_HINTS = ["Wrong suit.", "That card doesn't suit me."].shuffle.cycle




  def self.run
    setup
    welcome
    repl
  end

  private

  def self.repl
    while true
      input = Readline.readline("> ", true)
      break if UI::EXITKEYWORDS.include?(input)
      binding.pry if input == "pry"
      print_options if input == 'o'
      if Evaluation.valid_response?(input)
        new_guess = @round.record_guess(input)
        if new_guess.correct?
          respond_to_correct; print_round_stats
          @round = Round.new
        else
          respond_to_guess(Evaluation.evaluate_wrong_guess(new_guess))
        end
      else
        ask_for_valid
      end
    end
  end

  def self.setup
    @deck = StandardPlaying.new()
    @deck.shuffle!
    @round = Round.new(@deck)
    setup_auto_complete
  end

  def self.setup_auto_complete
    setup_responses_arr
    card_completer = proc { |s| @responses_arr.grep(/^#{s}/) }
    # greps argument was /^#{Regexp.escape(s)}/ in the online example.
    # I deleted this because I have no idea what it does and code runs exactly
    # the same without it

    Readline.completion_append_character = ""
    Readline.completion_proc = card_completer
  end

  def self.setup_responses_arr
    @responses_arr = []
    StandardPlaying::VALUES.each do |value|
      @responses_arr << "#{value} of "
    end
    @responses_arr += StandardPlaying::SUITS


  end


  #print methods
  def self.welcome(timing = false)
    puts "Welcome to Fun Guessing Game,
    \t\tthe card guessing game where you guess cards!"
    sleep(1) if timing
    puts "\nFirst, I, Ruby, will select a card..."
    sleep(4) if timing
    puts "\n\t\t...Oh, wow, that's a good one..."
    sleep(0.5) if timing
    puts "(Enter 'o' at any time to see options)"
    puts "\nReady, set, guess!"
  end

  def self.print_options
    puts "\nEnter 'pry' to pry."
    puts "Enter 'exit' 'exit!' 'quit' '!!!' or 'q' to leave.\n\n"
  end

  def self.random_card
    "#{StandardPlaying::VALUES.sample} of #{StandardPlaying::SUITS.sample}"
  end

  def self.ask_for_valid
    puts "I'm looking for cards. Something like #{random_card} or #{random_card}."
  end

  def self.respond_to_guess(info)
    puts INCORRECT_REACTIONS.next
    hints = []
    hints << TOO_HIGH_HINTS.next if info[:value] == :high
    hints << TOO_LOW_HINTS.next if info[:value] == :low
    hints << DIFF_SUIT_HINTS.next if info[:suit] == :same_color
    hints << DIFF_COLOR_HINTS.next if info[:suit] == :diff_color
    puts hints.sample
  end

  def self.respond_to_correct
    print "That's the card!  "
    puts CORRECT_REACTIONS.next
  end

  def self.print_round_stats
    i = @round.num_guesses
    if i < 7
      puts "It only took you #{i} guesses!"
    else
      puts "It took you #{i} guesses, but you got it!"
    end
    puts "Want to play another round?"
    puts "Too late, I already picked another card."
    puts "It could be any card, except for ones I've picked in previous rounds."
    puts "Can you guess?"
  end

  #evaluation methods


end
