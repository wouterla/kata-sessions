require 'obstacle'
require 'position'

RSpec.describe Obstacle do
  let(:obstacle) { Obstacle.new(Position.new(3, 3)) }

  it 'has a position' do
    expect(obstacle.position).to eq(Position.new(3, 3))
  end

  it 'can tell you if it is at a specific location' do
    expect(obstacle.at(Position.new(4, 4))).to be false
    expect(obstacle.at(Position.new(3, 3))).to be true
  end
end
