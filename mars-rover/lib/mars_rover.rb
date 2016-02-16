class MarsRover
  def initialize(starting_position, starting_facing)
    @position = starting_position
    @facing = starting_facing
  end

  def position
    [@position.x, @position.y, @facing.direction]
  end

  def forward
    @position.forward(@facing)
  end

  def backward
    @position.backward(@facing)
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
