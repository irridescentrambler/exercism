=begin
Write your code for the 'House' exercise in this file. Make the tests in
`house_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/house` directory.
=end

class House
  LINES = [
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

  def self.recite(n1, n2)
    (n1..n2).map do |n|
      recite_nth(n)
    end.join
  end

  def self.recite_nth(n)
    "This is the #{LINES[0, n].reverse.join(" ")}.\n"
  end
end
