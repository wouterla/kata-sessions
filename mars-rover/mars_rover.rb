require_relative 'rover_coordinate'

$NORTH = 'n'
$EAST  = 'e'
$SOUTH = 's'
$WEST  = 'w'
$STEP_FORWARD  = 'f'
$STEP_BACKWARD = 'b'
$TURN_RIGHT    = 'r'
$TURN_LEFT     = 'l'

class MarsRover
  attr_accessor :obstacle

  def initialize (current_coordinate,direction,grid)
    @current_coordinate = current_coordinate
    @facing = RoverDirection.new(direction)
    @grid = grid
  end

  def get_position
      return [@current_coordinate.to_s,@facing.to_s]
  end

  def execute commands
    @obstacle = nil

    commands.downcase.each_char do |command|
      cmd=RoverCommand.new(command)
      if cmd.step_command? then
        delta_coordinate = RoverCoordinate.new.coordinate_from_vector(@facing.to_s)

        new_coordinate = @current_coordinate + delta_coordinate if cmd.step_forward?
        new_coordinate = @current_coordinate - delta_coordinate if cmd.step_backward?

        new_coordinate = @grid.reposition(new_coordinate) unless @grid.on_grid?new_coordinate

        if @grid.obstacle?new_coordinate then
          @obstacle = new_coordinate
          return
        end
        @current_coordinate = new_coordinate
      end

      if cmd.turn_command? then
        @facing.turn_right if cmd.turn_right?
        @facing.turn_left  if cmd.turn_left?
      end
    end
  end
end

class RoverCommand
  def initialize command
    @command = command
  end

  def step_command?
    return step_forward? || step_backward?
  end

  def step_forward?
    @command == $STEP_FORWARD
  end

  def step_backward?
    @command == $STEP_BACKWARD
  end

  def turn_command?
    return turn_right? || turn_left?
  end

  def turn_right?
    return @command == $TURN_RIGHT
  end

  def turn_left?
    return @command == $TURN_LEFT
  end
end


class RoverDirection
  attr_accessor :direction

  def initialize direction
    @direction = direction
  end

  def turn_right
    case @direction
    when $NORTH
      @direction = $EAST
    when $EAST
      @direction = $SOUTH
    when $SOUTH
      @direction = $WEST
    when $WEST
      @direction = $NORTH
    end
  end

  def turn_left
    case @direction
    when $NORTH
      @direction = $WEST
    when $WEST
      @direction = $SOUTH
    when $SOUTH
      @direction = $EAST
    when $EAST
      @direction = $NORTH
    end
  end

  def to_s
    @direction
  end
end

