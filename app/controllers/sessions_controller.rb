class SessionsController < ApplicationController
  def new
    redirect_to :dashboard and return if current_user    
  end

  def create
    logout
    if user = User.authenticate(env['omniauth.auth'])
      auto_login(user)
      flash[:success] = 'Logged you in.'
      redirect_to :dashboard
    else
      flash[:error] = 'Ruh oh. Something went wrong.'
      redirect_to :login
    end
  end

  def destroy
    logout
    flash[:success] = 'Logged you out.'
    redirect_to :login
  end
end
