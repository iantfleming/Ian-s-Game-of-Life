# frozen_string_literal: true

require 'game'

describe Game do
  let(:world) { World.new }

  it 'can create an instance of game' do
    game = Game.new
    expect(game).to be_kind_of(Game)
  end
  it 'should respond to proper methods' do
    expect(subject).to respond_to(:world)
    expect(subject).to respond_to(:seeds)
  end

  it 'should initialize properly' do
    expect(subject.world).to be_kind_of(World)
    # expect(subject.world.cell_grid[1][1].alive?).to be(true)
    # expect(subject.seeds).to be_kind_of(Array)
  end

  it 'should plant seeds properly' do
    game = Game.new(world, [[1, 2], [0, 2]])
    expect(world.cell_grid[1][2].alive?).to be(true)
    expect(world.cell_grid[0][2].alive?).to be(true)
  end

  # RULE 1

  it 'will kill a live cell with no neighbours' do
    game = Game.new(world, [[1, 1]])
    game.world.cell_grid[1][1].alive = true
    expect(world.cell_grid[1][1].alive?).to be(true)
    game.tick!
    expect(world.cell_grid[1][1].dead?).to be(true)
  end

  it 'will kill a live cell with 1 live neighbour' do
    game = Game.new(world, [[1, 0], [2, 0]])
    game.tick!
    expect(world.cell_grid[1][0].dead?).to be(true)
    expect(world.cell_grid[2][0].dead?).to be(true)
  end

  it "doesn't kill a live cell with 2 neighbours" do
    game = Game.new(world, [[0, 1], [1, 1], [2, 1]])
    game.tick!
    expect(world.cell_grid[1][1].alive?).to be(true)
  end

  # RULE 2

  it 'a cell with 2 live neighbours will live on to the next generation' do
    game = Game.new(world, [[0, 1], [1, 1], [2, 1]])
    expect(world.live_neighbours_around_cell(world.cell_grid[1][1]).count).to eq 2
    game.tick!
    expect(world.cell_grid[0][1].dead?).to be(true)
    expect(world.cell_grid[1][1].alive?).to be(true)
    expect(world.cell_grid[2][1].dead?).to be(true)
  end

  it 'a cell with 3 live neighbours will live on to the next generation' do
    game = Game.new(world, [[0, 1], [1, 1], [2, 1], [2, 2]])
    expect(world.live_neighbours_around_cell(world.cell_grid[1][1]).count).to eq 3
    game.tick!
    expect(world.cell_grid[0][1].dead?).to be(true)
    expect(world.cell_grid[1][1].alive?).to be(true)
    expect(world.cell_grid[2][1].alive?).to be(true)
    expect(world.cell_grid[2][2].alive?).to be(true)
  end

  # RULE 3

  it 'should kill a live cell with more than 3 live neighbours' do
    game = Game.new(world, [[0, 1], [1, 1], [2, 1], [2, 2], [1, 2]])
    expect(world.live_neighbours_around_cell(world.cell_grid[1][1]).count).to eq 4
    game.tick!
    expect(world.cell_grid[0][1].alive?).to be(true)
    expect(world.cell_grid[1][1].dead?).to be(true)
    expect(world.cell_grid[2][1].alive?).to be(true)
    expect(world.cell_grid[2][2].alive?).to be(true)
    expect(world.cell_grid[1][2].dead?).to be(true)
  end

  # RULE 4
  it 'revives dead cells with 3 neighbours' do
    game = Game.new(world, [[0, 1], [1, 1], [2, 1]])
    expect(world.live_neighbours_around_cell(world.cell_grid[1][0]).count).to eq 3
    game.tick!
    expect(world.cell_grid[1][0].alive?).to be(true)
    expect(world.cell_grid[1][2].alive?).to be(true)
  end
end
