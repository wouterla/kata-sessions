require 'rspec'
require_relative 'rover_coordinate'

describe 'A Rover Coordinate' do

  before(:each) do
    @rovercoordinate_1_1=RoverCoordinate.new(1,1)
    @rovercoordinate_2_2=RoverCoordinate.new(2,2)
    @rovercoordinate_3_3=RoverCoordinate.new(3,3)
  end

  it 'should return a string of the initialized coordinate' do
    expect(@rovercoordinate_2_2.to_s).to eq('(2,2)')
  end

  it 'should add coordinates (1,1) and (2,2) to sum up (3,3) ' do
    rovercoordinate_3_3=@rovercoordinate_1_1+@rovercoordinate_2_2
    expect( rovercoordinate_3_3.to_s ).to eq('(3,3)')
  end

  it 'should add coordinates (1,1) to (2,2) and result in (3,3) ' do
    @rovercoordinate_2_2 += @rovercoordinate_1_1
    expect( @rovercoordinate_2_2.to_s ).to eq('(3,3)')
  end
  it 'should substract coordinates (1,1) from (3,3) and result in (2,2) ' do
    @rovercoordinate_3_3 -= @rovercoordinate_1_1
    expect( @rovercoordinate_3_3.to_s ).to eq('(2,2)')
  end

  it 'should add coordinates (-1,9) and (2,-10) to (1,-1) ' do
    expect((RoverCoordinate.new(-1,9) + RoverCoordinate.new(2,-10)).to_s).to eq('(1,-1)')
  end

  it 'should convert a vector ("n") to coordinate (0,1)' do
    rovercoordinate =  RoverCoordinate.coordinate_from_vector('n')
    expect(rovercoordinate.to_s).to eq('(0,1)')
  end

  it 'should return true if comparing two different objects with same values' do
    first_coordinate_1_1=RoverCoordinate.new(1,1)
    second_coordinate_1_1=RoverCoordinate.new(1,1)
    expect(first_coordinate_1_1==second_coordinate_1_1).to eq(true)
  end
end