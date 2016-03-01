# class Dimensions is to define the maximum size of the map (N, E, S, W)
class Dimensions

   def initialize (n,e,s,w)
     $max_n = n
	 $max_e = e
	 $max_s = s
	 $max_w = w
   end
   
   def get_dimensions
      return [$max_n,$max_e,$max_s,$max_w]
   end
 end

# class Obstacle is to define a position of an obstacle on the map
class Obstacle

  def initialize (x,y)
   $obstacle_pos_x = x
   $obstacle_pos_y = y
  end

  def get_obstacle_position
      return [$obstacle_pos_x,$obstacle_pos_y]
  end
end

# class MarsRover is to move the MarsRover on the map taking into account the position of an obstacle and the dimensions of the map.
class MarsRover
  DIRECTIONS = ['N','E','S','W']

  def initialize (x,y,direction)
   @pos_x = x
   @pos_y = y
   @direction = DIRECTIONS.index(direction)
   @commands = []
  end

  def get_position
      return [@pos_x,@pos_y,DIRECTIONS[@direction]]
  end

  def move rovercommand
  
# Get the commands and put them in an array
	
    @commands = rovercommand.split("")

# Go through all of the commands	

	@commands.length.times do | i |
	
# If the command is either 'r' or 'l' turn the rover in the correct direction
	
		if @commands[i] == "r" then
		  @direction = (@direction + 1) % 4
		end
		if @commands[i] == "l" then
		  @direction = (@direction - 1) % 4
		end

# If the command is either 'f' or 'b' move the rover forward or backwards in the current direction
# But before moving first check if there is an obstacle in the way AND if marsrover is still within the 
# boundaries of the map.
# If the marsrover is moving outside the boundaries of the map then marsrover may move to the other side of the map. 
# However it is only allowed to do so if there is no obstacle there.		

		if DIRECTIONS[@direction] == 'N' 
			if @commands[i] == "f"
				if not ($obstacle_pos_x == @pos_x && $obstacle_pos_y == (@pos_y + 1) || (@pos_y == $max_n))
					@pos_y = @pos_y + 1
				elsif (@pos_y == $max_n)
					if not ($obstacle_pos_x == @pos_x && $obstacle_pos_y == -($max_s - 1))
					  @pos_y = -($max_s - 1)
					end 
				end
			elsif @commands[i] == "b"
				if not ($obstacle_pos_x == @pos_x && $obstacle_pos_y == (@pos_y - 1) || (@pos_y == -$max_s))
					@pos_y = @pos_y - 1
				elsif (@pos_y == -$max_s)
					if not ($obstacle_pos_x == @pos_x && $obstacle_pos_y == ($max_n - 1))
					  @pos_y = $max_n - 1
					end
				end
			end
		end
		
		if DIRECTIONS[@direction] == 'E' 
			if @commands[i] == "f"
				if not ($obstacle_pos_x == (@pos_x + 1) && $obstacle_pos_y == @pos_y || (@pos_x == $max_e))
					@pos_x = @pos_x + 1
				elsif (@pos_x == $max_e)
					if not ($obstacle_pos_x == -($max_w - 1) && $obstacle_pos_y == @pos_y)
					  @pos_x = -($max_w - 1)
					end					
				end
			elsif @commands[i] == "b"
				if not ($obstacle_pos_x == (@pos_x - 1) && $obstacle_pos_y == @pos_y || (@pos_x == -$max_w))
					@pos_x = @pos_x - 1
				elsif (@pos_x == -$max_w)
					if not ($obstacle_pos_x == ($max_e - 1) && $obstacle_pos_y == @pos_y)
						@pos_x = $max_e - 1
					end										
				end
			end
		end
		
		if DIRECTIONS[@direction] == 'S' 
			if @commands[i] == "f"
				if not ($obstacle_pos_x == @pos_x && $obstacle_pos_y == (@pos_y - 1) || (@pos_y == -$max_s))
					@pos_y = @pos_y - 1
				elsif (@pos_y == -$max_s)
					if not ($obstacle_pos_x == @pos_x && $obstacle_pos_y == ($max_n - 1))
					  @pos_y = $max_n - 1						
					end					
				end
			elsif @commands[i] == "b"
				if not ($obstacle_pos_x == @pos_x && $obstacle_pos_y == (@pos_y + 1) || (@pos_y == $max_n))
					@pos_y = @pos_y + 1
				elsif (@pos_y == $max_n)
					if not ($obstacle_pos_x == @pos_x && $obstacle_pos_y == -($max_s -1))
						@pos_y = -($max_s -1)
					end
				end
			end
		end
		
		if DIRECTIONS[@direction] == 'W' 
			if @commands[i] == "f"
				if not ($obstacle_pos_x == (@pos_x - 1) && $obstacle_pos_y == @pos_y || (@pos_x == -$max_w))
					@pos_x = @pos_x - 1
				elsif (@pos_x == -$max_w)
					if not ($obstacle_pos_x == ($max_e -1) && $obstacle_pos_y == @pos_y)
						@pos_x = $max_e -1
					end
				end
			elsif @commands[i] == "b"
				if not ($obstacle_pos_x == (@pos_x + 1) && $obstacle_pos_y == @pos_y || (@pos_x == $max_e))
					@pos_x = @pos_x + 1
				elsif (@pos_x == $max_e)
					if not ($obstacle_pos_x == -($max_w - 1) && $obstacle_pos_y == @pos_y)
						@pos_x = -($max_w - 1)
					end
				end
			end
		end
    end		
  end
end

