require_relative 'navigator'

class MarsRover

  def initialize
    @navigator = Navigator.new([0,0,'N'])
  end

  def show_position
    @navigator.show_position
  end

  def command(commands)
    commands.split("").each do |command|
      case command
      when 'f'
        @navigator.move(1)
      when 'b'
        @navigator.move(-1)
      when 'l'
        @navigator.rotate(-1)
      when 'r'
        @navigator.rotate(1)
      end
    end
  end

end
