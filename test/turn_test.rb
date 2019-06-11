# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test
  def setup
    @card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @turn = Turn.new('Juneau', @card)
    @bad_turn = Turn.new('Wrong guess', @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_a_guess
    assert_equal @turn.guess, 'Juneau'
  end

  def test_it_has_a_card
    assert_instance_of Card, @turn.card
  end

  def test_correct?
    assert_equal @turn.correct?, true
    assert_equal @bad_turn.correct?, false
  end

  def test_feedback
    assert_equal @turn.feedback, 'Correct!'
    assert_equal @bad_turn.feedback, 'Incorrect.'
  end
end
