class Position
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

  def forward(direction)
    case direction.direction
    when :north
      @y += 1
    when :south
      @y -= 1
    when :east
      @x += 1
    when :west
      @x -= 1
    end
  end

  def backward(direction)
    case direction.direction
    when :north
      @y -= 1
    when :south
      @y += 1
    when :east
      @x -= 1
    when :west
      @x += 1
    end
  end
end
