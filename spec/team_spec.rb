require './lib/player'
require './lib/team'

RSpec.describe Team do
  it 'exists' do
    team = Team.new("France")

    expect(team).to be_instance_of(Team)
  end

  it 'Team has a country passed as argument' do
    team = Team.new("France")

    expect(team.country).to eq("France")
  end

  it 'Team initializes not eliminated' do
    team = Team.new("France")

    expect(team.eliminated?).to be false
  end

  it 'can be eliminated' do
    team = Team.new("France")
    expect(team.eliminated?).to be false

    team.eliminated = true 

    expect(team.eliminated?).to be true
  end


end
