module Game
  class SudokuChecker
    def initialize sudoku
      @sudoku = sudoku
    end

    def check
      initialize_check_process

      each_row do
        each_column do
          add_value_to_checking_row
          add_value_to_checking_column
          add_value_to_sub_block_sums

          @correct = checking_row? && checking_column? if last_column?
          @correct = check_sub_block_sum? if block_finish? && @correct
        end
      end

      @correct
    end

    private

    def initialize_check_process
      @sub_block_sums = (@sudoku.blocks * @sudoku.block_size).times.map { 0 }
      @correct, @row_index = true, 0
    end

    def each_row
      while @row_index < @sudoku.height && @correct
        @checking_row, @checking_column, @column_index = [], [], 0
        yield
        @row_index += 1
      end
    end

    def each_column
      while @column_index < @sudoku.width && @correct
        yield
        @column_index += 1
      end
    end

    def add_value_to_checking_row
      @checking_row << @sudoku.get(@row_index, @column_index)
    end

    def add_value_to_checking_column
      @checking_column << @sudoku.get(@column_index, @row_index)
    end

    def block_index
      (@row_index / block_size) * block_size + @column_index / block_size
    end

    def add_value_to_sub_block_sums
      @sub_block_sums[block_index] += @sudoku.get(@row_index, @column_index)
    end

    def last_column?
      @sudoku.width == @column_index + 1
    end

    def block_finish?
      0 == (@row_index + 1) % block_size && 0 == (@column_index + 1) % block_size
    end

    def block_size
      @sudoku.block_size
    end

    def checking_row?
      @checking_row.uniq!.nil?
    end

    def checking_column?
      @checking_column.uniq!.nil?
    end

    def check_sub_block_sum?
      @sudoku.block_sum == @sub_block_sums[block_index]
    end
  end
end