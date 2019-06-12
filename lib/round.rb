# frozen_string_literal: true

require_relative './turn.rb'

class Round
  attr_accessor :deck, :turns, :current_card, :index

  def initialize(deck)
    @deck = deck
    @turns = []
    @index = 0
    @current_card = @deck.cards[@index]
  end

  def take_turn(guess)
    turn = Turn.new(guess, @current_card)
    @turns.push(turn)
    @index += 1
    @current_card = @deck.cards[@index]
    turn
  end

  def number_correct
    @turns.select(&:correct?).length
  end

  def number_correct_by_category(category)
    @turns.select do |turn|
      turn.correct? && turn.card.category == category
    end.length
  end

  def percent_correct
    num_correct = @turns.select(&:correct?).length
    (num_correct.to_f / @turns.length * 100).to_i
  end

  def percent_correct_by_category(category)
    correct = turns.select do |turn|
      turn.correct? && turn.card.category == category
    end
    cards = deck.cards.select do |card|
      card.category == category
    end

    (correct.length.to_f / cards.length * 100).to_i
  end
end
