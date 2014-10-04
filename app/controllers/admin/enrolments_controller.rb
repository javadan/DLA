class Admin::EnrolmentsController < Admin::BaseController
  respond_to :html

  def index
    @teams = Team.includes(enrolments: :user).all
  end

  def pending
    @enrolments = Enrolment.where(approved: false)
  end

  def approve
    @enrolment = Enrolment.find(params[:id])
    @enrolment.approved = true
    @enrolment.save
    redirect_to :back
  end

  def destroy
    @enrolment = Enrolment.find(params[:id])
    @enrolment.destroy
    redirect_to :back
  end
end
