require 'bounded_planet_surface'
require 'position'

RSpec.describe BoundedPlanetSurface do
  let(:surface) { BoundedPlanetSurface.new(5, 10) }

  it 'has a range of x values' do
    expect(surface.x_range).to eq Range.new(0, 5)
  end

  it 'has a range of y values' do
    expect(surface.y_range).to eq Range.new(0, 10)
  end

  context 'when at a position inside the boundary' do
    let(:position) { Position.new(3, 3) }

    it 'leaves the position unchanged' do
      result = surface.position(position)
      expect(result).to eq Position.new(3, 3)
    end
  end

  context 'when at a position north and east of the boundary' do
    it 'limits the position to the north east corner' do
      position = Position.new(10, 15)
      result = surface.position(position)

      expect(result).to eq Position.new(5, 10)
    end
  end

  context 'when at a position south and west of the boundary' do
    it 'limits the position to the south west corner' do
      position = Position.new(-7, -29)
      result = surface.position(position)

      expect(result).to eq Position.new(0, 0)
    end
  end
end
