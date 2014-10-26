class DashboardsController < AuthenticatedController
  before_action :check_profile_updated
  def show
    @tasks = {
      enrolment: {
        done: -> { current_user.enrolments.any? },
        deadline: DateTime.parse('29 October 2014 5pm')
        },
      confirm_email: {
        done: -> { current_user.email_confirmed? },
        deadline: DateTime.parse('27 October 2014 5pm')
        },
      fundraising_idea: {
        done: -> { current_user.feedbacks.where(category: 'fundraising').any? },
        deadline: DateTime.parse('3 November 2014 5pm'),
      }
    }
  end

  protected
  def check_profile_updated
    unless current_user.profile_updated?
      redirect_to [:edit, :profile], notice: 'Please verify that your details are correct.' and return
    end
  end
end