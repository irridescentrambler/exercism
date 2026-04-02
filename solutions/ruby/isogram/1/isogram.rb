class Isogram
  def self.isogram?(input)
    input_with_downcase_without_special_chars = input.downcase.gsub(/[-" "]/, "")
    input_with_downcase_without_special_chars == input_with_downcase_without_special_chars.chars.uniq.join
  end
end