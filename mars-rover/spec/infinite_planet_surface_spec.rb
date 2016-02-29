require 'infinite_planet_surface'
require 'position'
require 'obstacle'

RSpec.describe InfinitePlanetSurface do
  let(:surface) { InfinitePlanetSurface.new }

  it 'always returns an unchanged position' do
    position = Position.new(1000000, -99999999)
    result = surface.position(position)
    expect(result).to eq Position.new(1000000, -99999999)
  end

  it 'can remember positions of obstacles' do
    obstacle = Obstacle.new(Position.new(1, 1))
    surface.add_obstacle obstacle
    expect(surface.obstacle_at(Position.new(1, 1))).to be true
    expect(surface.obstacle_at(Position.new(0, 0))).to be false
  end
end
