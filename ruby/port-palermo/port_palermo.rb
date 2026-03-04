# frozen_string_literal: true

module Port
  IDENTIFIER = :PALE
  TERMINAL_A_COMMODITIES = ['OIL', 'GAS'].freeze

  def self.object_space_stats
    ObjectSpace.count_objects
  end

  def self.object_space_total
    ObjectSpace.count_objects.values.sum
  end

  def self.get_identifier(city)
    city.slice(0, 4).upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    commodity = ship_identifier.to_s.slice(0,3)
    TERMINAL_A_COMMODITIES.include?(commodity) ? :A : :B
  end
end
