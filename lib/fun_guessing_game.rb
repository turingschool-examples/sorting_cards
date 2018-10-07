require_relative 'ui'
require_relative 'standard_playing'
require_relative 'round'
require_relative 'evaluation'
require_relative 'print'
require 'readline'
require'pry'


class FunGuessingGame < UI

  def self.run
    setup
    Print.welcome
    repl
    Print.goodbye(@round.percent_correct)
  end

  private

  def self.repl
    while true
      input = Readline.readline("> ", true)
      break if UI::EXITKEYWORDS.include?(input)
      binding.pry if input == "pry"
      Print.print_options if input == 'o'
      if Evaluation.valid_response?(input)
        new_guess = @round.record_guess(input)
        if new_guess.correct?
          Print.respond_to_correct; Print.print_round_stats(@round)
          @round = Round.new
        else
          Print.respond_to_guess(Evaluation.evaluate_wrong_guess(new_guess))
        end
      else
        Print.ask_for_valid
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

end
