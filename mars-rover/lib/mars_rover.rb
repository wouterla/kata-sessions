class MarsRover
  attr_reader :completed_move

  def initialize(starting_position, starting_facing, planet_surface)
    @position = starting_position
    @facing = starting_facing
    @planet_surface = planet_surface
    @stopped = false
    @completed_move = ''
  end

  def position
    [@position.x, @position.y, @facing.direction]
  end

  def forward
    @position, success = @planet_surface.forward(@position, @facing)
    success
  end

  def backward
    @position, success = @planet_surface.backward(@position, @facing)
    success
  end

  def left
    @facing.left
    true
  end

  def right
    @facing.right
    true
  end

  def move(move_string)
    move_string.downcase.each_char do |move|
      if single_move(move)
        @completed_move += move
      else
        @stopped = true
        break
      end
    end
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

  def stopped?
    @stopped
  end

end
