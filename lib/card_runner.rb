# frozen_string_literal: true

require_relative './card'
require_relative './deck'
require_relative './round'

card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)

deck = Deck.new([card_1, card_2, card_3])

round = Round.new(deck)

def start(deck, round)
  index = 1
  puts "Welcome! you're playing with #{deck.cards.length} card(s)!"
  puts '------------------------------------------------'
  while round.turns.length < deck.cards.length
    puts "This is round #{index} of #{deck.cards.length}."
    puts round.current_card.question
    guess = gets.chomp
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

start(deck, round)
