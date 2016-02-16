class Facing
  DIRECTIONS = [
    :north,
    :east,
    :south,
    :west
  ]

  def initialize
    @current_direction = 0
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


class MarsRover
  def initialize(x,y,facing)
    @x = x
    @y = y
    @facing = facing
  end

  def position
    return [@x,@y,@facing]
  end

  def forward
    case @facing
    when :north
      @y += 1
    when :south
      @y -= 1
    when :west
      @x -= 1
    when :east
      @x += 1
    end
  end

  def backward
    case @facing
    when :north
      @y -= 1
    when :south
      @y += 1
    when :west
      @x += 1
    when :east
      @x -= 1
    end
  end

  def left
    case @facing
    when :north
      @facing = :west
    when :south
      @facing = :east
    when :west
      @facing = :south
    when :east
      @facing = :north
    end
  end

  def right
    case @facing
    when :north
      @facing = :east
    when :south
      @facing = :west
    when :west
      @facing = :north
    when :east
      @facing = :south
    end
  end

  def move(move_string)
    move_string.split(//).each do |move|
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
