module Chess
  FILES = ('A'..'H').freeze
  RANKS = (1..8).freeze

  def self.valid_square?(rank, file)
    FILES.include?(file) && RANKS.include?(rank)
  end

  def self.nickname(first_name, last_name)
    (first_name[0,2] + last_name[-2,2]).upcase
  end

  def self.move_message(first_name, last_name, square)
    if valid_square?(square.chars.last.to_i, square.chars.first)
      "#{nickname(first_name, last_name)} moved to #{square}"
    else
      "#{nickname(first_name, last_name)} attempted to move to #{square}, but that is not a valid square"
    end
  end
end
