class TorusPlanetSurface
  attr_reader :x_range, :y_range

  def initialize(max_x, max_y)
    @x_range = 0..max_x
    @y_range = 0..max_y
  end

  def forward(position, facing)
    [position(position.forward(facing)), facing]
  end

  def backward(position, facing)
    [position(position.backward(facing)), facing]
  end

  def position(position)
    if position_within_bounds?(position)
      position
    else
      lock_position_to_boundary(position)
    end
  end

  private

  def position_within_bounds?(position)
    x_range.include?(position.x) && y_range.include?(position.y)
  end

  def lock_position_to_boundary(position)
    mapped_x = position.x % x_range.size
    mapped_y = position.y % y_range.size
    Position.new(mapped_x, mapped_y)
  end
end
