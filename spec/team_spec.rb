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

  it 'initializes with no players' do
    team = Team.new("France")

    expect(team.players).to eq([])
  end

  it 'can have multiple players' do
    team = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    expect(team.players).to eq([])

    team.add_player(mbappe)

    expect(team.players).to eq([mbappe])

    team.add_player(pogba)

    expect(team.players).to eq([mbappe, pogba])
    expect(team.players[0]).to be_instance_of Player
  end


end
