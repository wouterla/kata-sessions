require 'mars_rover'
require 'facing'
require 'position'
require 'obstacle'
require 'bounded_planet_surface'
require 'infinite_planet_surface'

RSpec.describe 'A Mars Rover' do
  context 'when driving over an infinite plane' do
    before :each do
      starting_position = Position.new(3, 3)
      starting_facing = Facing.new(:north)
      @planet_surface = InfinitePlanetSurface.new
      @rover = MarsRover.new(starting_position, starting_facing, @planet_surface)
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

    it 'stops before impacting an obstacle and reports failure' do
      @planet_surface.add_obstacle Obstacle.new(Position.new(3,7))
      expect(rover.stopped?).to be false
      rover.move('fffffffffff')
      expect(rover.position).to match_array([3, 6, :north])
      expect(rover.stopped?).to be true
      expect(rover.completed_move).to eq 'fff'
    end
  end

  context 'when driving over a bounded plane' do
    before :each do
      starting_position = Position.new(3, 3)
      starting_facing = Facing.new(:north)
      @planet_surface = BoundedPlanetSurface.new(5, 5)
      @rover = MarsRover.new(starting_position, starting_facing, @planet_surface)
    end

    let(:rover) { @rover }

    it 'cannot drive past the northern boundary' do
      5.times { rover.forward }
      expect(rover.position).to match_array([3, 5, :north])
    end

    it 'cannot drive past the southern boundary' do
      5.times { rover.backward }
      expect(rover.position).to match_array([3, 0, :north])
    end

    it 'cannot drive past the eastern boundary' do
      rover.right
      15.times { rover.forward }
      expect(rover.position).to match_array([5, 3, :east])
    end

    it 'cannot drive past the western boundary' do
      rover.left
      18.times { rover.forward }
      expect(rover.position).to match_array([0, 3, :west])
    end

    it 'stops before impacting an obstacle and reports failure' do
      @planet_surface.add_obstacle Obstacle.new(Position.new(3,4))
      expect(rover.stopped?).to be false
      rover.move('fffffffffff')
      expect(rover.position).to match_array([3, 3, :north])
      expect(rover.completed_move).to eq ''
      expect(rover.stopped?).to be true
    end
  end
end
