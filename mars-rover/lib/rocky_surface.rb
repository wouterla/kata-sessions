module RockySurface
  def clear_obstacles
    @obstacles = []
  end

  def add_obstacle(obstacle)
    @obstacles << obstacle
  end

  def obstacle_at(position)
    @obstacles.any? { |obstacle| obstacle.at(position) }
  end

  def check_for_obstacles(position, new_position)
    if obstacle_at(new_position)
      [position, false]
    else
      [new_position, true]
    end
  end
end
