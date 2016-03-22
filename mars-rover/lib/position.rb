class Position
  FORWARD_MOVEMENT_SCALE_FACTOR = 1
  BACKWARD_MOVEMENT_SCALE_FACTOR = -1

  attr_reader :x, :y

  def initialize(x = 0, y = 0)
    @x = x
    @y = y
  end

  def to_s
    "[#{x}, #{y}]"
  end

  def inspect
    "#<Position: #{self}>"
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def forward(direction)
    movement(direction, FORWARD_MOVEMENT_SCALE_FACTOR)
  end

  def backward(direction)
    movement(direction, BACKWARD_MOVEMENT_SCALE_FACTOR)
  end

  private

  def movement(direction, scale_factor)
    direction_modifier = direction_scale(direction.increasing?)
    movement = scale_factor * direction_modifier

    Position.new(
      direction.x_axis? ? x + movement : x,
      direction.y_axis? ? y + movement : y
    )
  end


  def direction_scale(increasing)
    increasing ? 1 : -1
  end
end
