class UsersController < AuthenticatedController
  inherit_resources

  actions :index
end
