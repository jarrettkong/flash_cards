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
    turn = Turn.new(guess, current_card)
    turns.push(turn)
    self.index = index == deck.cards.length ? 0 : index + 1
    self.current_card = deck.cards[index]
    turn
  end

  def number_correct
    correct = turns.select(&:correct?)
    correct.length
  end

  def number_correct_by_category(category)
    correct = turns.select { |turn| turn.correct? && turn.card.category == category }
    correct.length
  end

  def percent_correct
    correct = turns.select(&:correct?)
    ((correct.length.to_f / turns.length) * 100).to_i
  end

  def percent_correct_by_category(category)
    correct = turns.select { |turn| turn.correct? && turn.card.category == category }
    cards = deck.cards.select { |card| card.category == category }
    ((correct.length.to_f / cards.length) * 100).to_i
  end
end
