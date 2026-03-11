class BookStore
  BOOK_VALUE = 800

  def self.calculate_price(books)
    series = calculate_series(books)
    optimised_series = optimise_series(series)
    calculate_price_for_series(optimised_series)
  end

  private

  class << self

    def optimise_series(series)
      while ((index_for_5 = series.index(5)) && (index_for_3 = series.index(3)))
        series[index_for_5] = 4
        series[index_for_3] = 4
      end
      series
    end

    def calculate_series(list_of_books)
      pending_list = list_of_books.dup
      result = []
      series_count = 0
      while pending_list.length > 0
        (1..5).each do |book_index|
          if pending_list.include?(book_index)
            series_count += 1
            index = pending_list.index(book_index)
            pending_list.delete_at(index)
          end
        end
        result << series_count
        series_count = 0
      end
      result
    end

    def calculate_price_for_series(series)
      series.reduce(0.00) do |sum, series_count|
        case series_count
        when 1
          sum += BOOK_VALUE/100.to_f
        when 2
          sum += ((BOOK_VALUE.to_f - (BOOK_VALUE * 5/100)) * 2)/100
        when 3
          sum += ((BOOK_VALUE.to_f - (BOOK_VALUE * 10/100)) * 3)/100
        when 4
          sum += ((BOOK_VALUE.to_f - (BOOK_VALUE * 20/100)) * 4)/100
        when 5
          sum += ((BOOK_VALUE.to_f - (BOOK_VALUE * 25/100)) * 5)/100
        end
      end
    end
  end
end