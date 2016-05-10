require_relative 'mars_rover'

class RoverCoordinate
  attr_accessor :x, :y

  def initialize (x=0,y=0)
    @x = x
    @y = y
  end

  def +(coordinate)
    new_x = @x + coordinate.x
    new_y = @y + coordinate.y
    RoverCoordinate.new(new_x, new_y)
  end

  def -(coordinate)
    new_x = @x - coordinate.x
    new_y = @y - coordinate.y
    RoverCoordinate.new(new_x, new_y)
  end

  def ==(coordinate)
    (@x == coordinate.x) && (@y == coordinate.y)
  end

  def to_s
    "(#{@x},#{@y})"
  end

  def self.coordinate_from_vector(direction)
    delta_coordinate = RoverCoordinate.new( 0, 1) if direction == $NORTH
    delta_coordinate = RoverCoordinate.new( 1, 0) if direction == $EAST
    delta_coordinate = RoverCoordinate.new( 0,-1) if direction == $SOUTH
    delta_coordinate = RoverCoordinate.new(-1, 0) if direction == $WEST

    delta_coordinate
  end
end

class RoverGrid
  def initialize(bottom_left, top_right, obstacles=nil)
    @bottom_left  = bottom_left
    @top_right    = top_right
    @obstacles    = obstacles
  end

  def on_grid?(coordinate)
    (x_coordinate_valid?coordinate) && (y_coordinate_valid?coordinate)
  end
  def x_coordinate_valid?(coordinate)
      coordinate.x.between?(@bottom_left.x, @top_right.x)
  end
  def y_coordinate_valid?(coordinate)
      coordinate.y.between?(@bottom_left.y, @top_right.y)
  end

  def to_s
    return "#{@bottom_left.to_s},#{@top_right.to_s}"
  end

  def reposition coordinate
    coordinate.x = simple_wrap_x(coordinate.x)
    coordinate.y = simple_wrap_y(coordinate.y)
    coordinate
  end

  def simple_wrap_x x
    simple_wrap( @bottom_left.x, @top_right.x, x)
  end
  def simple_wrap_y y
    simple_wrap(@bottom_left.y, @top_right.y, y)
  end 

  def simple_wrap(bottom, top, position)

    nodes_on_gridline = top - bottom + 1

    if position < bottom then
      position += nodes_on_gridline
    elsif position > top then
      position -= nodes_on_gridline
    end
    position
  end

  def obstacle? coordinate
    if @obstacles.nil?
      return false
    else
      return @obstacles.include?coordinate
    end
  end
end
