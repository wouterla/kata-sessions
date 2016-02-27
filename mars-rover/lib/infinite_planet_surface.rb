class InfinitePlanetSurface
  def forward(position, facing)
    [position(position.forward(facing)), facing]
  end

  def backward(position, facing)
    [position(position.backward(facing)), facing]
  end

  def position(position)
    position
  end
end
