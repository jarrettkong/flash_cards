# frozen_string_literal: true

require './lib/card_generator'
require './lib/deck'
require './lib/round'

def start
  cards = CardGenerator.new('./lib/cards.csv').cards
  deck = Deck.new(cards)
  round = Round.new(deck)

  index = 1
  puts "Welcome! you're playing with #{deck.cards.length} card(s)!"
  puts '------------------------------------------------'

  while round.turns.length < deck.cards.length
    puts "This is round #{index} of #{deck.cards.length}."
    puts round.current_card.question
    guess = gets.chomp.downcase
    result = round.take_turn(guess)
    puts result.feedback
    index += 1
  end

  game_over(round, deck)
end

def game_over(round, deck)
  categories = deck.cards.map(&:category).uniq
  puts '***** Game Over! *****'
  puts "You had #{round.number_correct} correct answers out of #{deck.cards.length} questions."
  categories.each { |category| puts "#{category} - #{round.percent_correct_by_category(category)}% correct" }
end

start
