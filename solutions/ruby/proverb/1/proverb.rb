
# frozen_string_literal: true

class Proverb
  attr_reader :chain, :qualifier

  def initialize(*chain, qualifier: nil)
    @chain = chain
    @qualifier = qualifier
  end

  def to_s
    return '' if chain.empty?
    verses = chain.each_cons(2).map do |current_element, next_element|
      "For want of a #{current_element} the #{next_element} was lost."
    end
    prefix = qualifier ? "#{qualifier} " : ''
    verses << "And all for the want of a #{prefix}#{chain[0]}."
    verses.join("\n")
  end
end