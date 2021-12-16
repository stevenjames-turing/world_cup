class Team
  attr_reader :country, :players
  attr_writer :eliminated

  def initialize(country)
    @country = country
    @eliminated = false
    @players = []
  end

  def eliminated?
    @eliminated
  end
end
