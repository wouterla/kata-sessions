require 'rspec'
require_relative 'navigator'

describe 'A navigator' do
  let(:navigator) { Navigator.new([0,0,'N']) }

  it 'should create a new navigator' do
    expect(navigator.show_position).to eq [0,0,'N']
  end

  it 'should navigate to north' do
    navigator.move(1)
    expect(navigator.show_position).to eq [0,1,'N']
  end

  it 'should navigate to south' do
    navigator.move(-1)
    expect(navigator.show_position).to eq [0,-1,'N']
  end

end
