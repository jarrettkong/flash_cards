# frozen_string_literal: true

require 'minitest/pride'
require 'minitest/autorun'
require './lib/deck'
require './lib/card_generator'

class DeckTest < Minitest::Test
  def setup
    @cards = CardGenerator.new('./lib/cards.csv').cards
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_cards
    assert_instance_of Array, @deck.cards
  end

  def test_count
    assert_equal @deck.cards.length, 4
  end

  def test_cards_in_category
    expected = @cards.select { |card| card.category == 'Turing Staff' }
    assert_equal @deck.cards_in_category('Turing Staff'), expected
  end
end
