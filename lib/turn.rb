# frozen_string_literal: true

class Turn
  attr_accessor :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    guess == card.answer
  end

  def feedback
    guess == card.answer ? 'Correct!' : 'Incorrect.'
  end
end
