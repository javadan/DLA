class Admin::MeetingsController < Admin::BaseController

  inherit_resources

  load_and_authorize_resource

  decorates_assigned :meeting, :meetings

  decorates_assigned :meeting_attendances

  actions :index, :new, :create, :show, :edit, :update, :destroy


  def show
    show! do
      @meeting_attendances = MeetingAttendance.all # @meeting.meeting_attendances 
    end
  end

  def permitted_params
    params.permit(meeting: [:scheduled_for, :state])
  end
end
