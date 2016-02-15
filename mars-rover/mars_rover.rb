class MarsRover

  MOVE_COMMANDS = ['f', 'b']
  DIRECTION_COMMANDS = ['l', 'r']

  def initialize(position, direction)
    @position = position
    @direction = Directions.get(direction)
  end

  def position
    @position
  end

  def direction
    @direction
  end

  def execute_command(commands)
    commands.split("").each do | command |
      execute_single_command(command)
    end
  end

  def execute_single_command(command)
    if DIRECTION_COMMANDS.include?(command)
      change_direction(command)
    elsif MOVE_COMMANDS.include?(command)
      move(command)
    end
  end

  def move(command)
    @position = @position.move(@direction, command)
  end

  def change_direction(command)
    case command
    when 'r'
      @direction = Directions.get(@direction.next)
    when 'l'
      @direction = Directions.get(@direction.previous)
    end
  end
end

class Cell

  def initialize(x, y)
    @x = x
    @y = y
  end

  def x
    @x
  end

  def y
    @y
  end

  def move(direction, command)
    case direction.axis
    when :x_axis
      new_x = perform_step(x, direction.step, command)
      new_y = y
    when :y_axis
      new_x = x
      new_y = perform_step(y, direction.step, command)
    end
    Cell.new(new_x, new_y)
  end

  def perform_step(original_value, step, command)
    case command
    when 'f'
      return original_value + step
    when 'b'
      return original_value - step
    end
  end

  def ==(another_cell)
    self.x == another_cell.x && self.y == another_cell.y
  end
end

class Directions
  
  @@directions = nil

  def self.init
    @@directions = {
        'N' => Direction.new('N', :y_axis, 1, 'W', 'E'),
        'E' => Direction.new('E', :x_axis, 1, 'N', 'S'),
        'S' => Direction.new('S', :y_axis, -1, 'E', 'W'),
        'W' => Direction.new('W', :x_axis, -1, 'S', 'N')
    }
  end

  def self.get(name)
    if @@directions == nil
      init
    end
    @@directions[name]
  end
end

class Direction

  def initialize(name, axis, step, previous, following)
    @name = name
    @axis = axis
    @step = step
    @previous = previous
    @next = following
  end

  def name
    @name
  end

  def axis
    @axis
  end

  def step
    @step
  end

  def previous
    @previous
  end

  def next
    @next
  end
end
