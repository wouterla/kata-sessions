require 'position'
require 'facing'

RSpec.describe Position do
  let(:origin) { Position.new }

  it 'defaults to the origin' do
    expect(origin.to_s).to eq '[0, 0]'
  end

  it 'can be optionally set on creation' do
    position = Position.new(5, 2)
    expect(position.to_s).to eq '[5, 2]'
  end

  it 'supports equality comparison with another Position' do
    position1a = Position.new(9, 5)
    position1b = Position.new(9, 5)
    position2 = Position.new(5, 9)

    expect(position1a).to eq position1b
    expect(position1a).to_not eq position2
  end

  context 'when facing north' do
    let(:north) { Facing.new(:north) }

    it 'can move forward' do
      result = origin.forward(north)
      expect(result.to_s).to eq '[0, 1]'
    end

    it 'can move backwards' do
      result = origin.backward(north)
      expect(result.to_s).to eq '[0, -1]'
    end
  end

  context 'when facing east' do
    let(:east) { Facing.new(:east) }

    it 'can move forward' do
      result = origin.forward(east)
      expect(result.to_s).to eq '[1, 0]'
    end

    it 'can move backwards' do
      result = origin.backward(east)
      expect(result.to_s).to eq '[-1, 0]'
    end
  end
end
