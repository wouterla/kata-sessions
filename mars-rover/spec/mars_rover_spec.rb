require 'mars_rover'
require 'facing'
require 'position'


RSpec.describe 'A Mars Rover' do
  before :each do
    starting_position = Position.new(3, 3)
    starting_facing = Facing.new(:north)
    @rover = MarsRover.new(starting_position, starting_facing)
  end

  let(:rover) { @rover }

  it 'has a current position' do
    expect(rover.position).to match_array([3, 3, :north])
  end

  it 'can move one forward' do
    rover.forward
    expect(rover.position).to match_array([3, 4, :north])
  end

  it 'will do one backward' do
    rover.backward
    expect(rover.position).to match_array([3, 2, :north])
  end

  it 'will turn left' do
    rover.left
    expect(rover.position).to match_array([3, 3, :west])
  end

  it 'will turn left twice' do
    rover.left
    rover.left
    expect(rover.position).to match_array([3, 3, :south])
  end

  it 'will turn right' do
    rover.right
    expect(rover.position).to match_array([3, 3, :east])
  end

  it 'will turn left and forward' do
    rover.left
    rover.forward
    expect(rover.position).to match_array([2, 3, :west])
  end

  it 'will turn left and go backward' do
    rover.left
    rover.backward
    expect(rover.position).to match_array([4, 3, :west])
  end

  it 'will turn right and go backward' do
    rover.right
    rover.backward
    expect(rover.position).to match_array([2, 3, :east])
  end

  it 'will complete the exercise' do
    rover.forward
    rover.forward
    rover.right
    rover.forward
    rover.forward
    expect(rover.position).to match_array([5, 5, :east])
  end

  it 'takes a string of move commands' do
    rover.move('ffrff')
    expect(rover.position).to match_array([5, 5, :east])
  end

  it 'takes uppercase movement commands' do
    rover.move('FFRFF')
    expect(rover.position).to match_array([5, 5, :east])
  end
end
