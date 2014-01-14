class DashboardsController < AuthenticatedController
  before_action :check_profile_updated
  def show
  end

  protected
  def check_profile_updated
    unless current_user.profile_updated?
      redirect_to [:edit, :profile], notice: 'Please verify that your details are correct.' and return
    end
  end
end