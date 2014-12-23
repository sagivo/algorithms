# Alogirthm for Game of Life 
# Check more details here - http://en.wikipedia.org/wiki/Conway%27s_Game_of_Life

require "benchmark"

class GameOfLife
  attr_accessor :matrix, :cells, :rows, :columns

  def initialize rows, columns
    @rows, @columns = rows, columns
    @matrix = []
    rows.times do |row_index|
      @matrix[row_index] ||= []
      columns.times do |column_index|
        @matrix[row_index][column_index] = Cell.new(row_index, column_index)
      end
    end
    @cells = @matrix.flatten
  end

  def next_tick
    cells.each do |cell|
      cell.die unless cell.should_stay_live?(matrix)
      cell.reborn if cell.should_be_reborn?(matrix)
    end
    cells.each {|cell| cell.previous_alive = cell.alive}
  end

  def print_cells
    rows.times do |y|
      columns.times do |x|
        cell = matrix[y][x]
        cell.alive ? print("O") : print("-")
      end
      print "\n"
    end
    print "\n"
  end
end

class Cell
  attr_accessor :row, :column, :alive, :previous_alive

  def initialize row, column, alive=false
    @row, @column, @alive, @previous_alive = row, column, alive, alive
  end

  def alive= value
    @previous_alive = @alive = value
  end

  def neighbours matrix
    if @neighbours.nil?
      @neighbours = []
      rows_limit = matrix.count - 1
      columns_limit = matrix[0].count - 1
      ([0, row-1].max..[rows_limit, row+1].min).to_a.each do |row_index|
        ([0, column-1].max..[columns_limit, column+1].min).to_a.each do |column_index|
          @neighbours << matrix[row_index][column_index] unless row_index == row && column_index == column
        end
      end
    end
    @neighbours
  end

  def alive_neighbours matrix
    neighbours(matrix).select { |cell| cell.previous_alive }
  end

  def should_stay_live? matrix
    (alive_neighbours(matrix).count == 2 ||
      alive_neighbours(matrix).count == 3) && alive
  end

  def should_be_reborn? matrix
    alive_neighbours(matrix).count == 3 && !alive
  end

  def die
    @alive = false
  end

  def reborn
    @alive = true
  end
end

game = GameOfLife.new(100, 100)

# set alive cells
game.cells[22].alive = true
game.cells[23].alive = true
game.cells[24].alive = true
game.cells[26].alive = true
game.cells[16].alive = true
game.cells[36].alive = true

5.times do
  puts Benchmark.measure { game.next_tick }
  game.print_cells
end
