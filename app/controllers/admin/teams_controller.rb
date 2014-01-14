class Admin::TeamsController < AuthenticatedController
  inherit_resources
  load_and_authorize_resource
  actions :index, :new, :create, :edit, :update, :destroy

  def permitted_params
    params.permit(team: [:name, :role])
  end
end
