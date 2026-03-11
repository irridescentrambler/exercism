# frozen_string_literal: true

class Anagram
  attr_reader :word
  def initialize(word)
    @word = word.downcase
  end

  def match(list)
    list.select do |list_word|
      downcased_word = list_word.downcase
      next if downcased_word == word
      permutations.include?(downcased_word)
    end
  end

  def permutations
    @permutation ||= word.chars.permutation.map(&:join)
  end
end