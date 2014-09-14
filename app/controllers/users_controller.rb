class UsersController < AuthenticatedController
  inherit_resources

  def collection
    @users ||= end_of_association_chain.order(:last_name).decorate
  end
  def resource
    @user ||= super.decorate
  end

  actions :index
end
