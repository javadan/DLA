class Admin::MeetingAttendancesController < Admin::BaseController

  decorates_assigned :meeting_attendance, :meeting_attendances

  def create
    @meeting_attendance = meeting.meeting_attendances.create(meeting_attendance_params)
    redirect_to :back
  end

  def destroy
    @meeting_attendance = meeting.meeting_attendances.find(params[:id])
    @meeting_attendance.destroy
    redirect_to :back
  end

protected

  def meeting
    @meeting ||= Meeting.find(params[:meeting_id])
  end

  def meeting_attendance_params
    params.require(:meeting_attendance).permit(:user_id, :outcome)
  end

end
