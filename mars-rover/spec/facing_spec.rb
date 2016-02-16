require 'facing'

RSpec.describe Facing do
  it 'will default to the north direction' do
    facing = Facing.new
    expect(facing.direction).to eq :north
  end

  it 'will start with another direction' do
    facing = Facing.new(:east)
    expect(facing.direction).to eq :east
  end

  it 'can turn left' do
    facing = Facing.new
    facing.left
    expect(facing.direction).to eq :west
  end

  it 'can turn left 8 times and get back to the same facing' do
    facing = Facing.new
    8.times { facing.left }
    expect(facing.direction).to eq :north
  end


  it 'can turn right 7 times and get to west' do
    facing = Facing.new
    7.times { facing.right }
    expect(facing.direction).to eq :west
  end
end
