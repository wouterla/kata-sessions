require 'rspec'
require_relative 'mars_rover'


describe 'A Rover Command' do
  it 'Step_command? should return "true" if giving a stepping command' do
    rovercommand=RoverCommand.new('b')
    expect(rovercommand.step_command?).to eq(true)
  end

  it 'Step_forward? should return "true" if giving a "f" command' do
    rovercommand=RoverCommand.new('f')
    expect(rovercommand.step_forward?).to eq(true)
  end

  it 'Step_backward? should return "true" if giving a "b" command' do
    rovercommand=RoverCommand.new('b')
    expect(rovercommand.step_backward?).to eq(true)
  end

  it 'Turn_command? should return "true" if giving a turn command' do
    rovercommand=RoverCommand.new('l')
    expect(rovercommand.turn_command?).to eq(true)
  end

  it 'turn_right? should return "true" if giving a "r" command' do
    rovercommand=RoverCommand.new('r')
    expect(rovercommand.turn_right?).to eq(true)
  end

  it 'turn_left? should return "true" if giving a "l" command' do
    rovercommand=RoverCommand.new('l')
    expect(rovercommand.turn_left?).to eq(true)
  end
end