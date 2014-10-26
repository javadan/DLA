class FeedbacksController < AuthenticatedController
  respond_to :html

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.new(category: 'fundraising')
    @feedback.assign_attributes(feedback_params)
    @feedback.save

    render 'new' unless @feedback.persisted?
  end

protected
  def feedback_params
    params.require(:feedback).permit!
  end
end
