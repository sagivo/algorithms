# Alogirthm for Game of Life 
# Check more details here - http://en.wikipedia.org/wiki/Conway%27s_Game_of_Life

require "matrix"

class GameOfLife

  attr_accessor :matrix, :cells, :rows, :columns

  def initialize rows, columns
    @rows, @columns = rows, columns
    @matrix = Matrix.build(rows, columns)
    @cells = []
  end

  def generate_cells
    matrix.each do |row, column|
      @cells << Cell.new(column, row)
    end
  end

  def next_tick
    cells.each do |cell|
      cell.die if cell.cache_alive? && !cell.show_stay_live?(cells)
      cell.reborn if cell.cache_dead? && cell.should_be_reborn?(cells)
    end
    cells.each {|cell| cell.cache_alive = cell.alive}
  end

  def print_cells
    rows.times do |y|
      columns.times do |x|
        cell = find_cell_by_x_and_y(x, y)
        cell.alive? ? print("O") : print("-")
      end
      print "\n"
    end
    print "\n"
  end

  def find_cell_by_x_and_y x, y
    cells.select {|cell| cell.x == x && cell.y == y}.first
  end
end

class Cell

  attr_accessor :x, :y, :alive, :mates, :cache_alive

  def initialize x, y, alive=false
    @x, @y, @alive, @cache_alive = x, y, alive, alive
  end

  def alive= value
    @cache_alive = @alive = value
  end

  def neighbours_among cells
    @mates = cells - [self]
    mates.select do |cell|
      neighbour?(cell)
    end
  end

  def alive_neighbours_among cells
    neighbours_among(cells).select { |cell| cell.cache_alive? }
  end

  def dead_neighbours_among cells
    neighbours_among(cells).select { |cell| cell.cache_dead? }
  end

  def cache_alive?
    cache_alive
  end

  def cache_dead?
    !cache_alive
  end

  def alive?
    alive
  end

  def dead?
    !alive
  end

  def neighbour? cell
    distance_from_x(cell) < 2 && distance_from_y(cell) < 2
  end

  def distance_from_x cell
    (cell.x - x).abs
  end

  def distance_from_y cell
    (cell.y - y).abs
  end

  def show_stay_live? cells
    (alive_neighbours_among(cells).count == 2 ||
      alive_neighbours_among(cells).count == 3) && alive?
  end

  def should_be_reborn? cells
    alive_neighbours_among(cells).count == 3 && dead?
  end

  def die
    @alive = false
  end

  def reborn
    @alive = true
  end
end

# game = GameOfLife.new(10)
# game.generate_cells
# game.print_cells

# game.cells[22].alive = true
# game.cells[23].alive = true
# game.cells[24].alive = true
# game.cells[26].alive = true
# game.cells[16].alive = true
# game.cells[36].alive = true

# loop do
#   game.next_tick
#   game.print_cells
#   sleep 2
# end
