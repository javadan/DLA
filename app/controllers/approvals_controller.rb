class ApprovalsController < AuthenticatedController
  decorates_assigned :candidate, :candidates
  decorates_assigned :approval_votes
  decorates_assigned :current_user_approval_vote, with: ApprovalVoteDecorator

  def index
    @candidates = User.where(approved: false)
  end

  def show
    if @candidate == current_user
      redirect_to :back
      return
    end

    @candidate = User.where(approved: false).find(params[:id])
    @approval_votes = @candidate.candidate_approval_votes

    @current_user_approval_vote = current_user.approval_votes.find_by(candidate: @candidate)
  end

end
