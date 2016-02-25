require 'rspec'
require_relative 'rover_coordinate'

describe 'A Rover Grid' do

  before(:each) do
    @grid_bottom_left  = RoverCoordinate.new(0,0)
    @grid_top_right    = RoverCoordinate.new(4,4)

    @rovergrid = RoverGrid.new(@grid_bottom_left,@grid_top_right)
  end

  it 'should initialize on 2 coordinates and show in to_s' do
    expect(@rovergrid.to_s).to eq('(0,0),(4,4)')
  end

  it 'should respond True if a coordinate is on the grid' do
    coordinate_on_grid = RoverCoordinate.new(2,2)
    expect(@rovergrid.on_grid?coordinate_on_grid).to eq(true)
  end

  it 'should respond False if a coordinate is off the grid' do
    coordinate_off_grid = RoverCoordinate.new(5,5)
    expect(@rovergrid.on_grid?coordinate_off_grid).to eq(false)
  end

  it 'with grid (0,0)-(4,4), should return an on-grid coordinate (2,0) if calling reposition with off-grid (2,5)' do
    coordinate_off_grid = RoverCoordinate.new(2,5)
    coordinate_on_grid  = @rovergrid.reposition(coordinate_off_grid)
    expect(coordinate_on_grid.to_s).to eq('(2,0)')
  end

  it 'should return "true" if coordinate in an obstacle list' do
    obstacle_1 = RoverCoordinate.new(0,1)
    obstacle_2 = RoverCoordinate.new(2,2)
    obstacle   = RoverCoordinate.new(0,1)
    obstacles = [ obstacle_1, obstacle_2 ]
    rovergrid = RoverGrid.new(@grid_bottom_left,@grid_top_right,obstacles)
    expect(rovergrid.obstacle?obstacle).to eq(true)
  end

  it 'should return "false" if coordinate not in obstacle list' do
    obstacle_1 = RoverCoordinate.new(0,1)
    obstacle_2 = RoverCoordinate.new(2,2)
    obstacle_3 = RoverCoordinate.new(3,3)
    obstacles = [ obstacle_1, obstacle_2 ]
    rovergrid = RoverGrid.new(@grid_bottom_left,@grid_top_right,obstacles)
    expect(rovergrid.obstacle?obstacle_3).to eq(false)
  end

end