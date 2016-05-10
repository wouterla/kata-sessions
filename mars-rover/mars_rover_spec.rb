require 'rspec'
require_relative 'mars_rover'

describe 'A Mars Rover' do
  before(:each) do
    @coordinate_0_0 = RoverCoordinate.new(0,0)
    @grid_coordinate_bottom_left = RoverCoordinate.new(-10,-10)
    @grid_coordinate_top_right   = RoverCoordinate.new(10,10)
    @default_grid = RoverGrid.new(@grid_coordinate_bottom_left, @grid_coordinate_top_right)
    @default_rover=MarsRover.new(@coordinate_0_0,'n', @default_grid)
  end

  it 'should show the current position' do
    expect(@default_rover.get_position).to eq (['(0,0)','n'])
  end
  it 'should execute 1 forward if received command "f"' do
    @default_rover.execute 'f'
    expect(@default_rover.get_position).to eq (['(0,1)','n'])
  end
  it 'should execute 1 backward if received command "b"' do
    @default_rover.execute 'b'
    expect(@default_rover.get_position).to eq (['(0,-1)','n'])
  end
  it 'should face east if command "r" and started facing North' do
    @default_rover.execute 'r'
    expect(@default_rover.get_position).to eq (['(0,0)','e'])
  end
  it 'should face South if command "r" and started facing East' do
    rover=MarsRover.new(@coordinate_0_0,'e', @default_grid)
    rover.execute 'r'
    expect(rover.get_position).to eq (['(0,0)','s'])
  end

  it 'should face North if command "r" and started facing West' do
    rover=MarsRover.new(@coordinate_0_0,'w', @default_grid)
    rover.execute 'r'
    expect(rover.get_position).to eq (['(0,0)','n'])
  end

  it 'should face West if command "l" and started facing North' do
    @default_rover.execute 'l'
    expect(@default_rover.get_position).to eq (['(0,0)','w'])
  end

  it 'should execute east if facing east and command "f"' do
    rover=MarsRover.new(@coordinate_0_0,'e', @default_grid)
    rover.execute 'f'
    expect(rover.get_position).to eq (['(1,0)','e'])
  end

  it 'should accept multiple commands' do
    @default_rover.execute 'ffrfflbb'
    expect(@default_rover.get_position).to eq (['(2,0)','n'])
  end

  it 'should accept even more multiple commands' do
    @default_rover.execute 'ffrfflbbrbllfr'
    expect(@default_rover.get_position).to eq (['(0,0)','n'])
  end

  it 'The rover is located at 0,0 facing North Given the command "ffrff" would put the rover at 2,2 facing East.' do
    @default_rover.execute 'ffrff'
    expect(@default_rover.get_position).to eq (['(2,2)','e'])
  end

  it 'with grid (0,0)-(6,6), should wrap to (2,0)  if stepping north at (2,6)' do
    coordinate_2_6 = RoverCoordinate.new(2,6)
    grid_coordinate_bottom_left = RoverCoordinate.new(0,0)
    grid_coordinate_top_right   = RoverCoordinate.new(6,6)
    @grid = RoverGrid.new(grid_coordinate_bottom_left, grid_coordinate_top_right)

    rover=MarsRover.new(coordinate_2_6,'n', @grid)
    rover.execute 'f'
    expect(rover.get_position).to eq (['(2,0)','n'])
  end

  it 'with default grid,     should wrap to (10,2) if stepping west  at (-10,2)' do
    coordinate_minus10_2 = RoverCoordinate.new(-10,2)
    rover=MarsRover.new(coordinate_minus10_2,'w', @default_grid)
    rover.execute 'f'
    expect(rover.get_position).to eq (['(10,2)','w'])
  end

  it 'when starting (0,0),"n" and obstacle at (0,2), should stop at (0,1)' do
    obstacle_1 = RoverCoordinate.new(0,2)
    obstacles = [ obstacle_1 ]
    grid  = RoverGrid.new(@grid_coordinate_bottom_left, @grid_coordinate_top_right, obstacles)
    rover = MarsRover.new(@coordinate_0_0,'n', grid)
    rover.execute 'ffffff'
    expect(rover.get_position).to eq(['(0,1)','n'])
  end

  it 'when blocked by obstacle, obstacle should return those coordinates' do
    obstacle_1 = RoverCoordinate.new(0,2)
    obstacles = [ obstacle_1 ]
    grid  = RoverGrid.new(@grid_coordinate_bottom_left, @grid_coordinate_top_right, obstacles)
    rover = MarsRover.new(@coordinate_0_0,'n', grid)
    rover.execute 'ffffff'
    expect(rover.obstacle.to_s).to eq('(0,2)')
  end

  it 'when NOT blocked by obstacle, obstacle should be nil' do
    grid  = RoverGrid.new(@grid_coordinate_bottom_left, @grid_coordinate_top_right)
    rover = MarsRover.new(@coordinate_0_0,'n', grid)
    rover.execute 'ffffff'
    expect(rover.obstacle).to eq(nil)
  end

  it 'when new commands after block and not blocked again, obstacle should be nil' do
    obstacle_1 = RoverCoordinate.new(0,2)
    obstacles = [ obstacle_1 ]
    grid  = RoverGrid.new(@grid_coordinate_bottom_left, @grid_coordinate_top_right, obstacles)
    rover = MarsRover.new(@coordinate_0_0,'n', grid)
    rover.execute 'ffffff'
    rover.execute 'rff'
    expect(rover.obstacle).to eq(nil)
  end
end
