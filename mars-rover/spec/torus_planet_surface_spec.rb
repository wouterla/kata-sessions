require 'torus_planet_surface'
require 'position'

RSpec.describe TorusPlanetSurface do
  let(:surface) { TorusPlanetSurface.new(5, 10) }

  context 'when at a position inside the boundary' do
    let(:position) { Position.new(3, 3) }

    it 'leaves the position unchanged' do
      result = surface.position(position)
      expect(result).to eq Position.new(3, 3)
    end
  end

  context 'when just over the max x position' do
    it 'wraps to the min x when mapped to the surface' do
      position = Position.new(6, 4)
      result = surface.position(position)

      expect(result).to eq Position.new(0, 4)
    end
  end

  context 'when just over the max y position' do
    it 'wraps to the min y when mapped to the surface' do
      position = Position.new(3, 11)
      result = surface.position(position)

      expect(result).to eq Position.new(3, 0)
    end
  end
end
