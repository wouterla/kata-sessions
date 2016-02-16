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

  context 'when facing north' do
    let(:north) { Facing.new(:north) }

    it 'can move forward' do
      origin.forward(north)
      expect(origin.to_s).to eq '[0, 1]'
    end

    it 'can move backwards' do
      origin.backward(north)
      expect(origin.to_s).to eq '[0, -1]'
    end
  end

  context 'when facing east' do
    let(:east) { Facing.new(:east) }

    it 'can move forward' do
      origin.forward(east)
      expect(origin.to_s).to eq '[1, 0]'
    end

    it 'can move backwards' do
      origin.backward(east)
      expect(origin.to_s).to eq '[-1, 0]'
    end
  end
end
