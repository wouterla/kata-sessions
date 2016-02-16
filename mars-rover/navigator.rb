class Navigator

  def initialize(position)
    @position = position
  end

  def show_position
    @position
  end

  def move(direction)
    case show_direction
      when 'N','S'
        @position[1] += direction
      when 'E','W'
        @position[0] += direction
    end
  end

  def rotate(direction)
    positions = ['N','E','S','W']
    indexes = Hash[positions.map.with_index.to_a]
    current_position = indexes[show_direction]
    @position[2] = positions[(current_position + direction) % 4]
  end

  private

  def show_direction
    @position[2]
  end

end
