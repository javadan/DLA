class Admin::EnrolmentsController < Admin::BaseController
  def index
    @enrolments = Enrolment.all
  end
end
