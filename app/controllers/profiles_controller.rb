class ProfilesController < AuthenticatedController
  def show
  end

  def edit
  end

  def update
    if current_user.update_attributes(user_params)
      current_user.update_attribute :profile_updated, true
      redirect_to :profile, notice: 'Updated your profile successfully.'
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def resend_email_confirmation
    current_user.generate_email_confirmation_token
    current_user.save
    UserMailer.email_confirmation(current_user).deliver
    redirect_to :profile, notice: "A confirmation email has been sent to #{current_user.email}"
  end
  

  skip_before_action :require_login, only: :confirm_email

  def confirm_email
    user = User.find_by(email_confirmation_token: params[:t])

    if user
      user.email_confirmed_at = DateTime.now
      user.save
      redirect_to :profile, notice: "Thanks for confirming your email address!"
    else
      render text: 'Invalid or expired email confirmation token'
      return
    end

  end
end
