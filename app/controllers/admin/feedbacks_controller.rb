class Admin::FeedbacksController < Admin::BaseController
  inherit_resources
  load_and_authorize_resource
  actions :index, :destroy, :show

end
