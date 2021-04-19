# frozen_string_literal: true

require 'gosu'
require './lib/cell'
require './lib/game'
require './lib/world'

class GameOfLifeWindow < Gosu::Window
  def initialize(height = 800, width = 600)
    @height = height
    @width = width
    super height, width, false
    self.caption = 'Game Of Life'

    # colour
    @background_colour = Gosu::Color.new(0xffdedede)
    @alive = Gosu::Color.new(0xfffffa78) # yellow
    @dead = Gosu::Color.new(0xffff0000) # red
    # game CLASS
    @cols = width / 10
    @rows = height / 10

    @col_width = width / @cols
    @row_height = height / @rows

    @world = World.new(@cols, @rows)
    @game = Game.new(@world)
    @game.world.randomly_populate
  end

  def update
    @game.tick!
  end

  def draw
    draw_quad(0, 0, @background_colour,
              width, 0, @background_colour,
              width, height, @background_colour,
              0, height, @background_colour)

    @game.world.cells.each do |cell|
      if cell.alive?
        draw_quad(cell.x * @col_width, cell.y * @row_height, @alive,
                  cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @alive,
                  cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @alive,
                  cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @alive)
      else
        draw_quad(cell.x * @col_width, cell.y * @row_height, @dead,
                  cell.x * @col_width + (@col_width - 1), cell.y * @row_height, @dead,
                  cell.x * @col_width + (@col_width - 1), cell.y * @row_height + (@row_height - 1), @dead,
                  cell.x * @col_width, cell.y * @row_height + (@row_height - 1), @dead)
      end
    end
  end

  def needs_cursor?
    true
  end
end

GameOfLifeWindow.new.show
