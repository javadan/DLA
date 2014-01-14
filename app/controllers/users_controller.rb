class UsersController < AuthenticatedController
  inherit_resources

  actions :index

  def collection
    @users ||= end_of_association_chain.order(:last_name).decorate
  end
  def resource
    @user ||= super.decorate
  end
end
