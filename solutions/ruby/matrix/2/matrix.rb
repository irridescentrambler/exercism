class Matrix
  attr_reader :rows, :columns

  def initialize(input_string)
    @rows = input_string.split("\n").map { |row| row.split.map(&:to_i) }
    @columns = @rows.transpose
  end

  def row(index)
    rows[index - 1]
  end

  def column(index)
    columns[index - 1]
  end
end
