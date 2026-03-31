class SpiralMatrix
  attr_reader :matrix_size
  attr_reader :generated_matrix
  attr_reader :current_col
  attr_reader :current_row
  attr_reader :direction
  
  def initialize(matrix_size)
    @matrix_size = matrix_size
    @current_col = 0
    @current_row = 0
    @direction = :col
  end

  def matrix
    @generated_matrix ||= generate_matrix
  end

  private

  def max_index
    matrix_size - 1
  end

  def can_populate_next_column?
    current_col < max_index && generated_matrix[current_row][current_col + 1].nil?
  end

  def can_populate_previous_column?
    current_col > 0 && generated_matrix[current_row][current_col - 1].nil?
  end

  def can_populate_next_row?
    current_row < max_index && generated_matrix[current_row + 1][current_col].nil?
  end

  def can_populate_previous_row?
    current_row > 0 && generated_matrix[current_row - 1][current_col].nil?
  end

  def generate_matrix
    if matrix_size.zero?
      @generated_matrix = []
      return @generated_matrix
    end

    @generated_matrix = Array.new(matrix_size) { Array.new(matrix_size) }
    current_num = 1
    
    @generated_matrix[0][0] = current_num
    current_num += 1

    max_num = matrix_size * matrix_size

    while current_num <= max_num
      if direction == :col
        if can_populate_next_column?
          @current_col += 1
          @generated_matrix[current_row][current_col] = current_num
          current_num += 1
        elsif can_populate_previous_column?
          @current_col -= 1
          @generated_matrix[current_row][current_col] = current_num
          current_num += 1
        else
          @direction = :row
        end
      elsif direction == :row
        if can_populate_next_row?
          @current_row += 1
          @generated_matrix[current_row][current_col] = current_num
          current_num += 1
        elsif can_populate_previous_row?
          @current_row -= 1
          @generated_matrix[current_row][current_col] = current_num
          current_num += 1
        else
          @direction = :col
        end
      end
    end
    @generated_matrix
  end
end