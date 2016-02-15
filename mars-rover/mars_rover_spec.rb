require 'rspec'
require_relative 'mars_rover'

describe 'A Mars Rover' do

  it 'should start on a given position 1,2' do
    rover = MarsRover.new(Cell.new(1, 2), 'N')
    expect(rover.position).to eq(Cell.new(1, 2))
  end

  it 'should start with a given direction S' do
    rover = MarsRover.new(Cell.new(0, 0), 'S')
    expect(rover.direction.name).to eq('S')
  end

  it 'should move one place forward for command f' do
    rover = MarsRover.new(Cell.new(0, 0), 'N')
    rover.execute_command('f')
    expect(rover.position).to eq(Cell.new(0, 1))
  end

  it 'should move one place backwards for command b' do
    rover = MarsRover.new(Cell.new(1, 1), 'N')
    rover.execute_command('b')
    expect(rover.position).to eq(Cell.new(1, 0))
  end

  it 'should change direction from N to E for command r' do
    rover = MarsRover.new(Cell.new(1, 0), 'N')
    rover.execute_command('r')
    expect(rover.direction.name).to eq('E')
  end

  it 'should change direction from W to N for command r' do
    rover = MarsRover.new(Cell.new(1, 0), 'W')
    rover.execute_command('r')
    expect(rover.direction.name).to eq('N')
  end

  it 'should change direction from W so S for command l' do
    rover = MarsRover.new(Cell.new(1, 0), 'W')
    rover.execute_command('l')
    expect(rover.direction.name).to eq('S')
  end

  it 'should change direction from N to W for command l' do
    rover = MarsRover.new(Cell.new(1, 0), 'N')
    rover.execute_command('l')
    expect(rover.direction.name).to eq('W')
  end

  it 'should move from [1, 1] to [2, 1] when direction is E and command is f' do
    rover = MarsRover.new(Cell.new(1, 1), 'E')
    rover.execute_command('f')
    expect(rover.position).to eq(Cell.new(2, 1))
  end

  it 'should run multiple commands' do
    rover = MarsRover.new(Cell.new(0, 0), 'N')
    rover.execute_command('ffrff')
    expect(rover.position).to eq(Cell.new(2, 2))
    expect(rover.direction.name).to eq('E')
  end
end
