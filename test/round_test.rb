# frozen_string_literal: true

require 'minitest/spec'
require 'minitest/autorun'
require './lib/card_generator'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
    @cards = CardGenerator.new('./lib/cards.csv').cards
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_a_deck
    assert_instance_of Deck, @round.deck
  end

  def test_it_has_turns
    assert_equal @round.turns, []
  end

  def test_it_has_index
    assert_equal @round.index, 0
  end

  def test_it_has_current_card
    assert_instance_of Card, @round.current_card
    assert_equal @round.current_card, @cards[@round.index]
  end

  def test_take_turn
    round = Round.new(@deck)
    turn = round.take_turn('10')
    assert_equal round.index, 1
    assert_equal round.current_card, @cards[round.index]
    assert_equal round.turns.length, 1
    assert_equal round.turns.last, turn
  end

  def test_number_correct
    round = Round.new(@deck)
    round.take_turn('19')
    round.take_turn('56')
    round.take_turn('nobody knows')
    assert_equal round.number_correct, 1
  end

  def test_number_correct_by_category
    round = Round.new(@deck)
    round.take_turn('10')
    round.take_turn('red panda')
    assert_equal round.number_correct_by_category('STEM'), 1
    assert_equal round.number_correct_by_category('Turing Staff'), 1
    assert_equal round.number_correct_by_category('Pop Culture'), 0
  end

  def test_percent_correct
    round = Round.new(@deck)
    round.take_turn('19')
    round.take_turn('56')
    round.take_turn('nobody knows')
    assert_equal round.percent_correct, 33
  end

  def test_percent_correct_by_category
    round = Round.new(@deck)
    round.take_turn('10')
    round.take_turn('red panda')
    assert_equal round.percent_correct_by_category('STEM'), 100
    assert_equal round.percent_correct_by_category('Turing Staff'), 50
    assert_equal round.percent_correct_by_category('PopCulture'), 0
  end
end
