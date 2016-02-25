require 'rspec'
require_relative 'mars_rover'

describe 'A Rover Direction' do
  it 'should return direction at "n" when init at "n"' do
    roverdirection = RoverDirection.new('n')
    expect(roverdirection.direction).to eq('n')
  end

  it 'should return direction at "e" when init at "n" and turns right' do
    roverdirection = RoverDirection.new('n')
    roverdirection.turn_right
    expect(roverdirection.to_s).to eq('e')
  end


end
