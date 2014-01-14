class AuthenticatedController < ApplicationController
  before_action :require_login
  def not_authenticated
    redirect_to :login, alert: 'Please log in to view this page.'
  end
end
