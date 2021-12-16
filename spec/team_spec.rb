require './lib/player'
require './lib/team'

RSpec.describe Team do
  it 'exists' do
    team = Team.new("France")

    expect(team).to be_instance_of(Team)
  end
end
