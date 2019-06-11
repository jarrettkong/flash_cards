# frozen_string_literal: true

require_relative './turn.rb'

class Round
  attr_accessor :deck, :turns, :current_card, :number_correct, :index

  def initialize(deck)
    @deck = deck
    @turns = []
    @index = 0
    @current_card = @deck.cards[@index]
    @number_correct = 0
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    turns.push(turn)
    self.index = index == deck.cards.length ? 0 : index + 1
    self.current_card = deck.cards[index]
    self.number_correct += 1 if turn.correct?
    turn
  end

  def number_correct_by_category(category)
    correct = turns.select { |turn| turn.correct? && turn.category == category }
    cards = deck.cards.select { |card| card.category == category }
    correct / cards
  end

  def perect_correct_by_category(category); end
end
