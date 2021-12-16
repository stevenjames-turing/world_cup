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

  it 'knows the active players by position played' do
    france = Team.new("France")
    croatia = Team.new("Croatia")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    vida = Player.new({name: "Domagoj Vida", position: "defender"})

    france.add_player(mbappe)
    france.add_player(pogba)
    croatia.add_player(vida)
    croatia.add_player(modric)

    world_cup = WorldCup.new(2018, [france, croatia])

    expect(world_cup.active_players_by_position("midfielder")).to eq([pogba, modric])
    expect(world_cup.active_players_by_position("forward")).to eq([mbappe])
    expect(world_cup.active_players_by_position("defender")).to eq([vida])
  end

  it 'eliminated players ar not included in active players by position' do
    france = Team.new("France")
    croatia = Team.new("Croatia")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    vida = Player.new({name: "Domagoj Vida", position: "defender"})
    france.add_player(mbappe)
    france.add_player(pogba)
    croatia.add_player(vida)
    croatia.add_player(modric)
    world_cup = WorldCup.new(2018, [france, croatia])

    croatia.eliminated = true

    expect(world_cup.active_players_by_position("midfielder")).to eq([pogba])
    expect(world_cup.active_players_by_position("forward")).to eq([mbappe])
    expect(world_cup.active_players_by_position("defender")).to eq([])
  end

  it 'can list all players by position as a hash' do
    france = Team.new("France")
    croatia = Team.new("Croatia")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    vida = Player.new({name: "Domagoj Vida", position: "defender"})
    france.add_player(mbappe)
    france.add_player(pogba)
    croatia.add_player(vida)
    croatia.add_player(modric)
    world_cup = WorldCup.new(2018, [france, croatia])

    expect(world_cup.all_players_by_position.keys).to eq(["forward", "midfielder", "defender"])
    expect(world_cup.all_players_by_position["forward"]).to eq([mbappe])
    expect(world_cup.all_players_by_position["defender"]).to eq([vida])
    expect(world_cup.all_players_by_position["midfielder"]).to eq([pogba, modric])
  end
end
