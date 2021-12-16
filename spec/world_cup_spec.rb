require './lib/player'
require './lib/team'
require './lib/world_cup'

RSpec.describe WorldCup do
  it 'exists' do
    france = Team.new("France")
    croatia = Team.new("Croatia")

    world_cup = WorldCup.new(2018, [france, croatia])

    expect(world_cup).to be_instance_of WorldCup
  end

  it 'has a year' do
    france = Team.new("France")
    croatia = Team.new("Croatia")

    world_cup = WorldCup.new(2018, [france, croatia])
  end

  it 'has 2 teams competing' do
    france = Team.new("France")
    croatia = Team.new("Croatia")

    world_cup = WorldCup.new(2018, [france, croatia])
  end

end
