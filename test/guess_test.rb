require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'

class GuessTest < Minitest::Test
  def test_it_exists
    guess = Guess.new()
  end
end
