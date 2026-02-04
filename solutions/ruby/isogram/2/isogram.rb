class Isogram
  def self.isogram?(input)
    letters_with_count = input.downcase.tr('- ', '').chars.tally
    letters_with_count.values.none?{|letter_count| letter_count > 1 }
  end
end