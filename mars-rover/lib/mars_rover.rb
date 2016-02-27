class MarsRover
  def initialize(starting_position, starting_facing, planet_surface)
    @position = starting_position
    @facing = starting_facing
    @planet_surface = planet_surface
  end

  def position
    [@position.x, @position.y, @facing.direction]
  end

  def forward
    @position = @planet_surface.forward(@position, @facing)
  end

  def backward
    @position = @planet_surface.backward(@position, @facing)
  end

  def left
    @facing.left
  end

  def right
    @facing.right
  end

  def move(move_string)
    move_string.downcase.each_char { |move| single_move(move) }
  end

  def single_move(move)
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
