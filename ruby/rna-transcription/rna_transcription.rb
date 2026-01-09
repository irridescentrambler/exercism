class Complement
  COMPLEMENTARIES = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }.freeze
  def self.of_dna(input)
    input.chars.map{ |char|COMPLEMENTARIES.fetch(char, "") }.join
  end
end


