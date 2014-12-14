class AuthenticatedController < ApplicationController
  before_action :require_login, :require_user_approval

  def not_authenticated
    redirect_to :login, alert: 'Please log in to view this page.'
  end

  def require_user_approval
    unless current_user.approved?
      render text: 'Your account is pending approval, contact enablers@dirtyloveaffairs.com for more info.'
      return
    end
  end

end
