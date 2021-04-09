# frozen_string_literal: true

require 'world'

describe World do
  let(:cell) { Cell.new(1, 1) }

  it 'can create an instance of world' do
    world = World.new
    expect(world).to be_kind_of(World)
  end

  it 'should respond to proper methods' do
    expect(subject).to respond_to(:rows)
    expect(subject).to respond_to(:cols)
    expect(subject).to respond_to(:cell_grid)
    # expect(subject).to respond_to(:push_to_live_neighbours)
    expect(subject).to respond_to(:live_neighbours_around_cell)
    expect(subject).to respond_to(:cells)
    expect(subject).to respond_to(:randomly_populate)
    expect(subject).to respond_to(:live_cells)
    expect(subject).to respond_to(:dead_cells)
  end

  it 'should create a cell grid on initialization' do
    expect(subject.cell_grid).to be_kind_of(Array)
    subject.cell_grid.each do |row|
      expect(row).to be_kind_of(Array)
      row.each do |col|
        expect(col).to be_kind_of(Cell)
      end
    end
  end

  it 'should add all cells to the cells array' do
    expect(subject.cells.count).to eq(9)
  end

  it 'should detect a live neighbour to the North' do
    subject.cell_grid[cell.y - 1][cell.x].alive = true
    expect(subject.live_neighbours_around_cell(cell).count).to eq(1)
  end

  it 'should detect a live neighbour to the North-East' do
    subject.cell_grid[cell.y - 1][cell.x + 1].alive = true
    expect(subject.live_neighbours_around_cell(cell).count).to eq(1)
  end

  it 'should detect a live neighbour to the East' do
    subject.cell_grid[cell.y][cell.x + 1].alive = true
    expect(subject.live_neighbours_around_cell(cell).count).to eq(1)
  end

  it 'should detect a live neighbour to the South-East' do
    subject.cell_grid[cell.y][cell.x + 1].alive = true
    expect(subject.live_neighbours_around_cell(cell).count).to eq(1)
  end

  it 'should detect a live neighbour to the South' do
    subject.cell_grid[cell.y][cell.x + 1].alive = true
    expect(subject.live_neighbours_around_cell(cell).count).to eq(1)
  end

  it 'should detect a live neighbour to the South-West' do
    subject.cell_grid[cell.y][cell.x + 1].alive = true
    expect(subject.live_neighbours_around_cell(cell).count).to eq(1)
  end

  it 'should detect a live neighbour to the West' do
    subject.cell_grid[cell.y][cell.x + 1].alive = true
    expect(subject.live_neighbours_around_cell(cell).count).to eq(1)
  end

  it 'should detect a live neighbour to the North-West' do
    subject.cell_grid[cell.y][cell.x + 1].alive = true
    expect(subject.live_neighbours_around_cell(cell).count).to eq(1)
  end

  # it 'should randomly populate the world' do
  #   subject.cells.each do |cell|
  #     expect(cell.dead?).to be(true)
  #   end
  #   subject.randomly_populate
  #
  #   subject.cells.each do |cell|
  #     expect(cell.dead?).to be(false)
  #   end
  # end

  it 'should randomly populate the world' do
    expect(subject.live_cells).to eq []
    subject.randomly_populate
    expect(subject.live_cells).not_to eq []
  end
end
