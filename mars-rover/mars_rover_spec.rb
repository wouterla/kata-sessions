require 'rspec'
require_relative 'mars_rover'

describe 'A Mars Rover' do

  it 'should show the current position' do
    rover=MarsRover.new(0,0,'N')
    expect(rover.get_position).to eq ([0,0,'N'])
  end
 
   it 'should give the position of an obstacle' do
    obstacle=Obstacle.new(1,1)  
    expect(obstacle.get_obstacle_position).to eq ([1,1])
  end
 
  it 'should give the coordinates 4, 1 and facing east if facing north and command is "flrbfrffff"' do
    rover=MarsRover.new(0,0,'N')
    dimensions=Dimensions.new(10,10,10,10)
	obstacle=Obstacle.new(nil,nil)
    rover.move 'flrbfrffff'
    expect(rover.get_position).to eq ([4,1,'E']) 	
  end  

  it 'should give the coordinates 8, 0 and facing east if sarting facing north and command is "rffflffrblbflfrbbrffrflffflfr" and there is an obstacle on 2,2' do
    rover=MarsRover.new(0,0,'N')
    dimensions=Dimensions.new(10,10,10,10)
	obstacle=Obstacle.new(2,2)
    rover.move 'rffflffrblbflfrbbrffrflffflfr'
    expect(rover.get_position).to eq ([8,0,'E']) 	
  end  

  it 'should give the dimensions of the map' do
    dimensions=Dimensions.new(10,10,10,10)  
    expect(dimensions.get_dimensions).to eq ([10,10,10,10])
  end
  
  it 'should give position 0,-9, N if forward is given 11 times when starting on 0,0 and facing North and maximum dimension for North is 10 and maximum dimension for South is 10' do
    rover=MarsRover.new(0,0,'N')    
    dimensions=Dimensions.new(10,10,10,10)   
	rover.move 'fffffffffff'
	expect(rover.get_position).to eq ([0,-9,'N'])
  end
  
  it 'should give position 0,10, N if forward is given 11 times when starting on 0,0 and facing North and maximum dimension for North is 10 \ 
  and maximum dimension for South is 10 and there is an obstacle on 0,-9' do
    rover=MarsRover.new(0,0,'N')    
    dimensions=Dimensions.new(10,10,10,10) 
	obstacle=Obstacle.new(0,-9)	
	rover.move 'fffffffffff'
	expect(rover.get_position).to eq ([0,10,'N'])
  end

  it 'should give position 0,19, N if backward is given 11 times when starting on 0,0 and facing North and maximum dimension for North is 20 and maximum dimension for South is 10' do
    rover=MarsRover.new(0,0,'N')    
    dimensions=Dimensions.new(20,10,10,10)  
	obstacle=Obstacle.new(nil,nil)	
	rover.move 'bbbbbbbbbbb'
	expect(rover.get_position).to eq ([0,19,'N'])
  end  
  
   it 'should give position 0,19, N if backward is given 12 times when starting on 0,0 and facing North and maximum dimension for North is 20 \ 
  and maximum dimension for South is 10 and there is an obstacle on 0,18' do
    rover=MarsRover.new(0,0,'N')    
    dimensions=Dimensions.new(20,10,10,10) 
	obstacle=Obstacle.new(0,18)	
	rover.move 'bbbbbbbbbbbb'
	expect(rover.get_position).to eq ([0,19,'N'])
  end 
  
   it 'should give position -9,0, E if forward is given 11 times when starting on 0,0 and facing East and maximum dimension for East is 10 and maximum dimension for West is 10' do
    rover=MarsRover.new(0,0,'E')    
    dimensions=Dimensions.new(20,10,10,10)  
	obstacle=Obstacle.new(nil,nil)	
	rover.move 'fffffffffff'
	expect(rover.get_position).to eq ([-9,0,'E'])
  end   
  
   it 'should give position -9,0, E if forward is given 13 times when starting on 0,0 and facing East and maximum dimension for East is 10 and maximum dimension for West is 10 /
   and there is an obstacle on -8,0' do
    rover=MarsRover.new(0,0,'E')    
    dimensions=Dimensions.new(20,10,10,10)  
	obstacle=Obstacle.new(-8,0)	
	rover.move 'fffffffffffff'
	expect(rover.get_position).to eq ([-9,0,'E'])
  end  
  
   it 'should give position -3,2,N if the command ffrbbbrfffflbbbbbblbbbbb is given when starting on 0,0 and facing North and maximum dimensions are 3,3,3,3 /
   and there is an obstacle on -3,1' do
    rover=MarsRover.new(0,0,'N')    
    dimensions=Dimensions.new(3,3,3,3)  
	obstacle=Obstacle.new(-3,1)	
	rover.move 'ffrbbbrfffflbbbbbblbbbbb'
	expect(rover.get_position).to eq ([-3,2,'N'])
  end   
  
  
  
end