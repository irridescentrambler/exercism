# frozen_string_literal: true

module House
  PHRASES = [
    'house that Jack built',
    'malt that lay in the',
    'rat that ate the',
    'cat that killed the',
    'dog that worried the',
    'cow with the crumpled horn that tossed the',
    'maiden all forlorn that milked the',
    'man all tattered and torn that kissed the',
    'priest all shaven and shorn that married the',
    'rooster that crowed in the morn that woke the',
    'farmer sowing his corn that kept the',
    'horse and the hound and the horn that belonged to the'
  ].freeze

  def self.recite(start_verse, end_verse)
    (start_verse..end_verse).map { |n| verse(n) }.join
  end

  def self.verse(verse_number)
    "This is the #{PHRASES.first(verse_number).reverse.join(' ')}.\n"
  end

  private_class_method :verse
end
