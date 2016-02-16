require 'rspec'
require_relative '../lib/mars_rover'


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

RSpec.describe 'A Mars Rover' do

  it 'will return the start position and facing' do
    rover = MarsRover.new(0,0,:north)
    expect(rover.position).to match_array([0,0,:north])
  end

it 'will saves its current position' do
  rover = MarsRover.new(2,1,:south)
  expect(rover.position).to match_array([2,1,:south])
end

  it 'will do one forward' do
    rover = MarsRover.new(0,0,:north)
    rover.forward
    expect(rover.position).to match_array([0,1,:north])
  end
  it 'will do one backward' do
    rover = MarsRover.new(0,1,:north)
    rover.backward
    expect(rover.position).to match_array([0,0,:north])
  end
  it 'will turn left' do
    rover = MarsRover.new(0,1,:north)
    rover.left
    expect(rover.position).to match_array([0,1,:west])
  end

  it 'will turn left twice' do
    rover = MarsRover.new(0,0,:north)
    rover.left
    rover.left
    expect(rover.position).to match_array([0,0,:south])
  end

  it 'will turn right' do
    rover = MarsRover.new(0,1,:north)
    rover.right
    expect(rover.position).to match_array([0,1,:east])
  end

  it 'will turn left and forward' do
    rover = MarsRover.new(2,2,:north)
    rover.left
    rover.forward
    expect(rover.position).to match_array([1,2,:west])
  end

  it 'will turn left and go backward' do
    rover = MarsRover.new(2,2,:north)
    rover.left
    rover.backward
    expect(rover.position).to match_array([3,2,:west])
  end

    it 'will turn right and go backward' do
      rover = MarsRover.new(2,2,:north)
      rover.right
      rover.backward
      expect(rover.position).to match_array([1,2,:east])
    end

    it 'will complete the exercise' do
      rover = MarsRover.new(0,0,:north)
      rover.forward
      rover.forward
      rover.right
      rover.forward
      rover.forward
      expect(rover.position).to match_array([2,2,:east])
    end

    it 'takes a string of move commands' do
      rover = MarsRover.new(0,0,:north)
      rover.move('ffrff')
      expect(rover.position).to match_array([2,2,:east])
    end

end
