class Obstacle
  attr_reader :position

  def initialize(position)
    @position = position
  end

  def at(position)
    @position == position
  end
end
