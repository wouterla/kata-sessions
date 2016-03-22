require 'rocky_surface'

class InfinitePlanetSurface
  include RockySurface

  def initialize
    clear_obstacles
  end

  def forward(position, facing)
    check_for_obstacles(position, position.forward(facing))
  end

  def backward(position, facing)
    check_for_obstacles(position, position.backward(facing))
  end

  def position(position)
    position
  end
end
