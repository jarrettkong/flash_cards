# frozen_string_literal: true

require 'csv'
require_relative './card'

class CardGenerator
  attr_accessor :cards

  def initialize(filename)
    csv = CSV.read(filename)
    @cards = csv.map { |data| Card.new(*data) }
  end
end
