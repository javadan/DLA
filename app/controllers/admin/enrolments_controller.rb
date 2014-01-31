class Admin::EnrolmentsController < Admin::BaseController
  def index
    @teams = Team.includes(enrolments: :user).all
  end
end
