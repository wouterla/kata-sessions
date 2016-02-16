class Facing
  DIRECTIONS = [
    :north,
    :east,
    :south,
    :west
  ]

  def initialize(starting_direction = :north)
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

  def xprogress
    case direction
    when :west
      return -1
    when :east
      return 1
    else
      return 0
    end
  end

  def yprogress
    case direction
    when :north
      return 1
    when :south
      return -1
    else
      return 0
    end
  end
end

class MarsRover
  def initialize(x,y,facing)
    @x = x
    @y = y
    @facing = Facing.new(facing)
  end

  def position
    return [@x, @y, @facing.direction]
  end

  def forward
    @x += @facing.xprogress
    @y += @facing.yprogress
  end

  def backward
    @x -= @facing.xprogress
    @y -= @facing.yprogress
  end

  def left
    @facing.left
  end

  def right
    @facing.right
  end

  def move(move_string)
    move_string.downcase.split(//).each do |move|
      case move
      when 'f'
        forward
      when 'b'
        backward
      when 'l'
        left
      when 'r'
        right
      end
    end
  end
end
