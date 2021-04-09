# frozen_string_literal: true

class Game
  attr_accessor :world, :seeds

  def initialize(world = World.new, seeds = [])
    @world = world
    # @seeds = seeds

    seeds.each do |seed|
      world.cell_grid[seed[0]][seed[1]].alive = true
    end
  end

  def tick!
    next_round_live_cells = []
    next_round_dead_cells = []

    world.cells.each do |cell|
      neighbour_count = world.live_neighbours_around_cell(cell).count
      # Rule 1
      next_round_dead_cells << cell if cell.alive? && neighbour_count < 2
      # Rule 2
      next_round_live_cells << cell if cell.alive? && ([2, 3].include? neighbour_count)
      # rule 3
      next_round_dead_cells << cell if cell.alive? && neighbour_count > 3
      # rule 4
      next_round_live_cells << cell if cell.dead? && world.live_neighbours_around_cell(cell).count == 3
    end
    next_round_live_cells.each(&:revive!)
    next_round_dead_cells.each(&:die!)
  end
end
