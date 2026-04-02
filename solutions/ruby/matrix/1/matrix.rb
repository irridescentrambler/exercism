=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

class Matrix
  attr_accessor :rows

  def initialize(input_string)
    @rows = input_string.split("\n").map{|row| row.split(" ").map(&:to_i) }
  end

  def row(row_number)
    rows[row_number - 1]
  end

  def column(column_number)
    rows.map do |row|
      row[column_number - 1]
    end
  end
end
