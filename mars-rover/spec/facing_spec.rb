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

  it 'supports equality comparison with other Facing' do
    facing1a = Facing.new(:north)
    facing1b = Facing.new(:north)
    facing2 = Facing.new(:south)

    expect(facing1a == facing1b).to be true
    expect(facing1a == facing2).to be false
  end

  it 'can be compared to a symbol' do
    facing = Facing.new(:north)
    expect(facing == :north).to be true
    expect(facing == :south).to be false
  end

  it 'can be printed' do
    facing = Facing.new(:north)
    expect(facing.to_s).to eq 'North'
  end

  it 'has a pretty printed inspect string' do
    facing = Facing.new(:north)
    expect(facing.inspect).to eq '#<Facing: North>'
  end
end
