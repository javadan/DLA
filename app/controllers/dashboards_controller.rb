class DashboardsController < AuthenticatedController
  before_action :check_profile_updated

  def show
    @days_until_clan_burns = (Date.parse('1 May 2015') - Date.today).to_i

    @unvoted_approval_candidates = User.where(approved: false).select do |u|
      current_user.approval_votes.where(candidate: u).empty?
    end

    @tasks = {
      enrolment: {
        done: -> { current_user.enrolments.any? },
        deadline: DateTime.parse('29 October 2014 5pm')
        },
      confirm_email: {
        done: -> { current_user.email_confirmed? },
        deadline: DateTime.parse('27 October 2014 5pm')
        },
      vote_for_candidates: {
        done: -> {
          @unvoted_approval_candidates.empty?
        },
        deadline: nil
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