class AssemblyLine
  attr_reader :speed
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    if (1..4).include?(speed)
      speed * 221
    elsif (5..8).include?(speed)
      speed * 198.9
    elsif speed == 9
      speed * 176.8
    else
      speed * 170.17
    end
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end
