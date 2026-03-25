# frozen_string_literal: true

class Microwave
  def initialize(time)
    @time = time
  end

  def timer
    minutes, seconds = (time < 100) ? convert_seconds_to_time(time) : convert_timer_string_to_time(time)
    "#{"%02d" % minutes}:#{"%02d" % seconds}"
  end

  private

  attr_reader :time

  def convert_seconds_to_time(time_in_seconds)
    minutes = time_in_seconds / 60
    seconds = time_in_seconds % 60
    [minutes, seconds]
  end

  def convert_timer_string_to_time(timer_string)
    chars = timer_string.to_s.chars
    seconds = chars.pop(2).join.to_i
    minutes = chars.join.to_i
    if seconds >= 60
      minutes_to_add, seconds = convert_seconds_to_time(seconds)
      minutes += minutes_to_add
    end
    [minutes, seconds]
  end
end
