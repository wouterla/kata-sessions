
class Facing
  DIRECTIONS = [
    :north,
    :east,
    :south,
    :west
  ]

  def initialize(starting_direction=:north)
    @current_direction = DIRECTIONS.index(starting_direction)
  end

  def direction
      DIRECTIONS[@current_direction]
  end

  def left
    @current_direction = (@current_direction - 1) % 4
  end

  def right
    @current_direction = (@current_direction + 1) % 4
  end
end

