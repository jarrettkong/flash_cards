# frozen_string_literal: true

require_relative './card'
require 'csv'

class CardGenerator
  attr_accessor :cards
  def initialize(filename)
    csv = CSV.read(filename, headers: false)
    @cards = csv.each { |data| Card.new(*data) }
  end
end
