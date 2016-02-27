class InfinitePlanetSurface
  def forward(position, facing)
    position(position.forward(facing))
  end

  def backward(position, facing)
    position(position.backward(facing))
  end

  def position(position)
    position
  end
end
