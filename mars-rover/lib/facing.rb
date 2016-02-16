
class Facing
  DIRECTIONS = [
    :north,
    :east,
    :south,
    :west
  ]

  DIRECTION_COUNT = DIRECTIONS.length

  def initialize(starting_direction = :north)
    @current_direction = DIRECTIONS.index(starting_direction)
  end

  def to_s
    direction.to_s.capitalize
  end

  def inspect
    "#<Facing: #{self}>"
  end

  def ==(other)
    if other.is_a?(Symbol)
      direction == other
    else
      direction == other.direction
    end
  end

  def direction
    DIRECTIONS[@current_direction]
  end

  def left
    @current_direction = (@current_direction - 1) % DIRECTION_COUNT
  end

  def right
    @current_direction = (@current_direction + 1) % DIRECTION_COUNT
  end

  def x_axis?
    [:east, :west].include? direction
  end

  def y_axis?
    [:north, :south].include? direction
  end

  def increasing?
    [:north, :east].include? direction
  end

  def decreasing?
    [:south, :west].include? direction
  end
end
