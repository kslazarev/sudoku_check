module Game
  class Sudoku
    HEIGHT = WIDTH = 9
    BLOCKS = BLOCK_SIZE = 3
    BLOCK_SUM = 45

    attr_reader :sudoku

    def initialize sudoku
      @sudoku = sudoku
    end

    def get row_index, column_index
      @sudoku[row_index][column_index]
    end

    def blocks
      BLOCKS
    end

    def block_size
      BLOCK_SIZE
    end

    def height
      HEIGHT
    end

    def width
      WIDTH
    end

    def block_sum
      BLOCK_SUM
    end
  end
end