# frozen_string_literal: true

module Blackjack
  CARD_VALUES = {
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9,
    "ten" => 10,
    "ace" => 11,
    "jack" => 10,
    "queen" => 10,
    "king" => 10
  }.freeze

  def self.parse_card(card)
    CARD_VALUES[card] || 0
  end

  def self.card_range(card1, card2)
    score = parse_card(card1) + parse_card(card2)
    case score
    when 4..11
      "low"
    when 12..16
      "mid"
    when 17..20
      "high"
    when 21
      "blackjack"
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    card_range = card_range(card1, card2)
    return "P" if card1 == "ace" && card2 == "ace"
    case card_range(card1, card2)
    when "high"
      "S"
    when "mid"
      parse_card(dealer_card) < 7 ? "S" : "H"
    when "low"
      "H"
    when "blackjack"
      [10, 11].include?(parse_card(dealer_card)) ? "S" : "W"
    end
  end
end
