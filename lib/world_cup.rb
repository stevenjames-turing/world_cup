class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    active_players_by_position =[]
    @teams.each do |team|
      if team.eliminated? == false
        active_players_by_position << team.players_by_position(position)
      end
    end
    active_players_by_position.flatten
  end

  def all_players_by_position
    all_players_by_position = {}
    @teams.each do |team|
      team.players.each do |player|
        if all_players_by_position.has_key?(player.position) == false
          all_players_by_position[player.position] = [] << player
        else
          all_players_by_position[player.position] << player
        end
      end
    end
    all_players_by_position
  end
end
