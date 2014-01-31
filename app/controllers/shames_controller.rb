class ShamesController < AuthenticatedController
  def index
    @users = User.where(shamed: true).decorate
  end
end