class EnrolmentsController < AuthenticatedController  
  inherit_resources
  load_and_authorize_resource
  actions :index, :create, :update, :show, :destroy
  
  before_action do
    @teams = Team.all
  end

  def begin_of_association_chain
    current_user
  end
  
  respond_to :html
  layout :set_layout

  def set_layout
    request.xhr? ? false : 'application'
  end

  def permitted_params
    params.permit(enrolment: [:team_id, :role])
  end

end
