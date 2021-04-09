# frozen_string_literal: true

class World
  attr_accessor :rows, :cols, :cell_grid, :cells

  # Scheme of default initialized world matrix
  #------------------------
  #     0     1     2
  # 0 [ dead, dead, dead ]
  # 1 [ dead, alive, dead ]
  # 2 [ dead, dead, dead ]
  #-----------------------

  def initialize(rows = 3, cols = 3)
    @rows = rows
    @cols = cols
    @cells = []

    @cell_grid = Array.new(rows) do |row|
      Array.new(cols) do |col|
        Cell.new(col, row) # NOTE: col is 1st
      end
    end

    cell_grid.each do |row|
      row.each do |element|
        cells << element if element.is_a?(Cell)
      end
    end
  end

  def live_cells
    cells.select(&:alive)
  end

  def dead_cells
    cells.select { |cell| cell.alive == false }
  end

  def live_neighbours_around_cell(cell)
    live_neighbours = []
    # Neighbour to the North-East
    if cell.y.positive? && (cell.x < (cols - 1))
      candidate = cell_grid[cell.y - 1][cell.x + 1]
      live_neighbours << candidate if candidate.alive?
    end
    # Neighbour to the South-East
    if (cell.y < (rows - 1)) && (cell.x < (cols - 1))
      candidate = cell_grid[cell.y + 1][cell.x + 1]
      live_neighbours << candidate if candidate.alive?
    end
    # Neighbours to the South-West
    if (cell.y < (rows - 1)) && cell.x.positive?
      candidate = cell_grid[cell.y + 1][cell.x - 1]
      live_neighbours << candidate if candidate.alive?
    end
    # Neighbours to the North-West
    if cell.y.positive? && cell.x.positive?
      candidate = cell_grid[cell.y - 1][cell.x - 1]
      live_neighbours << candidate if candidate.alive?
    end
    # Neighbour to the North
    if cell.y.positive?
      candidate = cell_grid[cell.y - 1][cell.x]
      live_neighbours << candidate if candidate.alive?
    end
    # Neighbour to the East
    if cell.x < (cols - 1)
      candidate = cell_grid[cell.y][cell.x + 1]
      live_neighbours << candidate if candidate.alive?
    end
    # Neighbour to the South
    if cell.y < (rows - 1)
      candidate = cell_grid[cell.y + 1][cell.x]
      live_neighbours << candidate if candidate.alive?
    end
    # Neighbours to the West
    if cell.x.positive?
      candidate = cell_grid[cell.y][cell.x - 1]
      live_neighbours << candidate if candidate.alive?
    end
    live_neighbours
  end

  def randomly_populate
    cells.each do |cell|
      cell.alive = [true, false].sample
    end
  end
end
