class ProfilesController < AuthenticatedController
  def edit
  end

  def update
    if current_user.update_attributes(user_params)
      current_user.update_attribute :profile_updated, true
      redirect_to :dashboard, notice: 'Updated your profile successfully.'
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
