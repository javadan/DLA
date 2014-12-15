class Admin::MeetingsController < Admin::BaseController
  inherit_resources
  load_and_authorize_resource
  decorates_assigned :meeting, :meetings

  actions :index, :new, :create, :show, :edit, :update, :destroy

  def permitted_params
    params.permit(meeting: [:scheduled_for, :state])
  end
end
