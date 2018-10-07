require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'

class GuessTest < Minitest::Test
  def setup
    @response = Guess.new(@response, @card)
  end

  def test_it_exists
    assert_instance_of Guess, @response
  end
end
