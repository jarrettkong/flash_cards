# frozen_string_literal: true

require 'minitest/pride'
require 'minitest/autorun'
require './lib/card_generator'
require './lib/card'

class CardGeneratorTest < Minitest::Test
  def setup
    @card_generator = CardGenerator.new('./lib/cards.csv')
  end

  def test_it_exists
    assert_instance_of CardGenerator, @card_generator
  end

  def test_it_has_cards
    @card_generator.cards.each do |card|
      assert_instance_of Card, card
    end
  end

  def test_correct_parse_from_file
    assert_equal @card_generator.cards[0].question, 'What is 5 + 5?'
    assert_equal @card_generator.cards[0].answer, '10'
    assert_equal @card_generator.cards[0].category, 'STEM'
  end
end
