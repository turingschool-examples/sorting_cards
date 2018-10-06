require_relative 'test_helper'
require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/standard_playing'


class TestStandardPlaying < Minitest::Test

  def setup
    @deck = StandardPlaying.new()
  end

  def test_it_has_52_cards
    assert_equal 52, @deck.cards.size
  end

  def test_it_is_deck
    assert @deck.is_a? Deck
  end


end
