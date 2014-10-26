class TeamsController < AuthenticatedController

  def index
    @teams = Team.order(:name)
  end

end