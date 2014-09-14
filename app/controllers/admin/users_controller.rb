class Admin::UsersController < Admin::BaseController
  inherit_resources
  actions :index, :edit, :update

  def collection
    @users ||= end_of_association_chain.order(:last_name).decorate
  end
  def resource
    @user ||= super.decorate
  end

  def permitted_params
    params.permit(user: [:name, :shamed])
  end

end
