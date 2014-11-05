class EnrolmentsController < AuthenticatedController  
  inherit_resources
  load_and_authorize_resource

  actions :index, :create, :update, :show, :destroy

  respond_to :html
  layout :set_layout
  
  before_action do
    @teams = Team.all.sort_by{ |t| t.name.upcase }
  end

  def create
    create! do
      is_lead_role = (@enrolment.role == 'lead')
      @enrolment.update_attribute(:approved, !is_lead_role)
      @enrolment      
    end
  end

  def update
    update! do
      is_lead_role = (@enrolment.role == 'lead')
      @enrolment.update_attribute(:approved, !is_lead_role)
      @enrolment
    end
  end

  def begin_of_association_chain
    current_user
  end

  def set_layout
    request.xhr? ? false : 'application'
  end

  def permitted_params
    params.permit(enrolment: [:team_id, :role])
  end

end
