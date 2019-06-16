# frozen_string_literal: true

class Turn
  attr_accessor :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == @card.answer.downcase
  end

  def feedback
    correct? ? 'Correct!' : 'Incorrect.'
  end
end
