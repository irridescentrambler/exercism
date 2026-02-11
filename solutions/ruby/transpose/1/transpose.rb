# frozen_string_literal: true

# Creats a transpose of a string
class Transpose
  SENTINEL = '__SENTINEL__'
  def self.transpose(input)
    matrix = string_to_matrix(input)
    max_length = max_row_length(matrix)
    matrix_with_same_row_length = balance_rows(matrix, max_length)
    matrix_with_same_row_length.transpose.map(&:join).map do |str|
      str.gsub(/(#{SENTINEL})+$/, '').gsub(/#{SENTINEL}/, ' ')
    end.join("\n").rstrip
  end

  # Pads each row to the given length with the sentinel value.
  #
  # @param matrix_with_uneven_rows [Array<Array<String>>] rows of characters
  # @param length [Integer] target row length
  # @return [Array<Array<String>>] rows padded to equal length
  def self.balance_rows(matrix_with_uneven_rows, length)
    matrix_with_uneven_rows.map { |row| row.fill(SENTINEL, row.length..(length - 1)) }
  end

  # Splits the input string into an array of character rows.
  #
  # @param input [String] newline-delimited text
  # @return [Array<Array<String>>] rows of characters
  def self.string_to_matrix(input)
    input.split("\n").map { |str| str.split('') }
  end

  # Returns the length of the longest row in the matrix.
  #
  # @param matrix [Array<Array<String>>] rows of characters
  # @return [Integer, nil] max row length, or nil for empty input
  def self.max_row_length(matrix)
    matrix.map(&:count).max
  end
end
