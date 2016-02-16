require 'rspec'
require_relative 'mars_rover'

describe 'A Mars Rover' do

  it 'should create a new rover' do
    rover = MarsRover.new

    expect(rover.show_position).to eq [0,0,'N']
  end

  it 'should move the rover one position forward, return [0,1,N]' do
    rover = MarsRover.new
    rover.command('f')
    expect(rover.show_position).to eq [0,1,'N']
  end

  it 'should move the rover one position backwards, return [0,-1,N]' do
    rover = MarsRover.new
    rover.command('b')
    expect(rover.show_position).to eq [0,-1,'N']
  end

    it 'should turn rover right, return E' do
    rover = MarsRover.new
    rover.command('r')
    expect(rover.show_position).to eq [0,0,'E']
  end

  it 'should turn rover left, return W' do
    rover = MarsRover.new
    rover.command('l')
    expect(rover.show_position).to eq [0,0,'W']
  end

  it 'should turn rover left twice, return S' do
    rover = MarsRover.new
    rover.command('l')
    rover.command('l')
    expect(rover.show_position).to eq [0,0,'S']
  end

  it 'should turn rover left, right, return N' do
    rover = MarsRover.new
    rover.command('l')
    rover.command('r')
    expect(rover.show_position).to eq [0,0,'N']
  end

  it 'should turn rover left, right - 1 command! -, return N' do
    rover = MarsRover.new
    rover.command('lr')
    expect(rover.show_position).to eq [0,0,'N']
  end


end
