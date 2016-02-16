require 'mars_rover'

RSpec.describe 'A Mars Rover' do
  it 'will return the start position and facing' do
    rover = MarsRover.new(0, 0, :north)
    expect(rover.position).to match_array([0, 0, :north])
  end

  it 'will saves its current position' do
    rover = MarsRover.new(2, 1, :south)
    expect(rover.position).to match_array([2, 1, :south])
  end

  it 'will do one forward' do
    rover = MarsRover.new(0, 0, :north)
    rover.forward
    expect(rover.position).to match_array([0, 1, :north])
  end

  it 'will do one backward' do
    rover = MarsRover.new(0, 1, :north)
    rover.backward
    expect(rover.position).to match_array([0, 0, :north])
  end
  it 'will turn left' do
    rover = MarsRover.new(0, 1, :north)
    rover.left
    expect(rover.position).to match_array([0, 1, :west])
  end

  it 'will turn left twice' do
    rover = MarsRover.new(0, 0, :north)
    rover.left
    rover.left
    expect(rover.position).to match_array([0, 0, :south])
  end

  it 'will turn right' do
    rover = MarsRover.new(0, 1, :north)
    rover.right
    expect(rover.position).to match_array([0, 1, :east])
  end

  it 'will turn left and forward' do
    rover = MarsRover.new(2, 2, :north)
    rover.left
    rover.forward
    expect(rover.position).to match_array([1, 2, :west])
  end

  it 'will turn left and go backward' do
    rover = MarsRover.new(2, 2, :north)
    rover.left
    rover.backward
    expect(rover.position).to match_array([3, 2, :west])
  end

  it 'will turn right and go backward' do
    rover = MarsRover.new(2, 2, :north)
    rover.right
    rover.backward
    expect(rover.position).to match_array([1, 2, :east])
  end

  it 'will complete the exercise' do
    rover = MarsRover.new(0, 0, :north)
    rover.forward
    rover.forward
    rover.right
    rover.forward
    rover.forward
    expect(rover.position).to match_array([2, 2, :east])
  end

  it 'takes a string of move commands' do
    rover = MarsRover.new(0, 0, :north)
    rover.move('ffrff')
    expect(rover.position).to match_array([2, 2, :east])
  end

  it 'takes uppercase movement commands' do
    rover = MarsRover.new(0, 0, :north)
    rover.move('FFRFF')
    expect(rover.position).to match_array([2, 2, :east])
  end
end
