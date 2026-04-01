# frozen_string_literal: true

class TwelveDays
  HUMANISED_NUMBER_MAP = {
    1 => 'first',
    2 => 'second',
    3 => 'third',
    4 => 'fourth',
    5 => 'fifth',
    6 => 'sixth',
    7 => 'seventh',
    8 => 'eighth',
    9 => 'ninth',
    10 => 'tenth',
    11 => 'eleventh',
    12 => 'twelfth'
  }.freeze

  LYRICS_MAP = {
    1 => 'a Partridge in a Pear Tree.',
    2 => 'two Turtle Doves, ',
    3 => 'three French Hens, ',
    4 => 'four Calling Birds, ',
    5 => 'five Gold Rings, ',
    6 => 'six Geese-a-Laying, ',
    7 => 'seven Swans-a-Swimming, ',
    8 => 'eight Maids-a-Milking, ',
    9 => 'nine Ladies Dancing, ',
    10 => 'ten Lords-a-Leaping, ',
    11 => 'eleven Pipers Piping, ',
    12 => 'twelve Drummers Drumming, '
  }.freeze

  def self.song
    (1..12).map do |number|
      "On the #{HUMANISED_NUMBER_MAP[number]} day of Christmas my true love gave to me: #{lyrics_map_for(number)}\n"
    end.join("\n")
  end

  def self.lyrics_map_for(number)
    if number == 1
      LYRICS_MAP[number]
    elsif number == 2
      "#{LYRICS_MAP[number]}and #{lyrics_map_for(number - 1)}"
    else
      LYRICS_MAP[number] + lyrics_map_for(number - 1)
    end
  end
end
