# frozen_string_literal: true

require 'cell'

describe Cell do
  it 'can create an instance of cell' do
    cell = Cell.new
    expect(cell).to be_kind_of(Cell)
  end

  it 'should respond to proper methods' do
    expect(subject).to respond_to(:alive)
    expect(subject).to respond_to(:x)
    expect(subject).to respond_to(:y)
    expect(subject).to respond_to(:alive?)
    expect(subject).to respond_to(:die!)
    expect(subject).to respond_to(:revive!)
  end

  it 'should initialize with alive set to false' do
    expect(subject.alive).to be(false)
  end

  it 'should initialize with x and y set to 0' do
    expect(subject.x).to be 0
    expect(subject.y).to be 0
  end
end
